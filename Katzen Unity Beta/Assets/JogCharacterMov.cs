using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[RequireComponent(typeof(CharacterController))]
[RequireComponent(typeof(Animator))]

public class JogCharacterMov : MonoBehaviour {
    protected static JogCharacterMov s_Instance;
    public static JogCharacterMov instance { get { return s_Instance; } }

    [Header("Velocidades de Movimentacao")]
    [Range(0f, 20f)]
    [SerializeField]
    public float velocidadeMaximaFoward = 8f;
    [Range(0f, 40f)]
    [SerializeField]
    public float gravidade = 20f;
    [Range(0f, 20f)]
    [SerializeField]
    public float velocidadePulo = 10f;
    [Range(100f, 600f)]
    [SerializeField]
    public float velocidadeMinimaVirada = 400f;
    [Range(500f, 1500f)]
    [SerializeField]
    public float velocidadeMaximaVirada = 1200f;
    [Range(0f, 20f)]
    [SerializeField]
    public float idleTempoDeOciosidade = 5f;
    public bool podeAtacar;
    public bool podeUsarEstilingue;

    public CameraSettings cameraSettings;
    //public GarrasMelee garrasMelee;
    public PlayerDeAudioRandomico footstepPlayer;         // Random Audio Players used for various situations.
    public PlayerDeAudioRandomico hurtAudioPlayer;
    public PlayerDeAudioRandomico landingPlayer;
    public PlayerDeAudioRandomico emoteLandingPlayer;
    public PlayerDeAudioRandomico emoteDeathPlayer;
    public PlayerDeAudioRandomico emoteAttackPlayer;
    public PlayerDeAudioRandomico emoteJumpPlayer;

    protected AnimatorStateInfo m_CurrentStateInfo;            //Information about the base layer of the animator cached.
    protected AnimatorStateInfo m_NextStateInfo;
    protected bool m_IsAnimatorTransitioning;
    protected AnimatorStateInfo m_PreviousCurrentStateInfo;    //Information about the base layer of the animator from last frame.
    protected AnimatorStateInfo m_PreviousNextStateInfo;
    protected bool m_PreviousIsAnimatorTransitioning;
    protected bool noChao = true;
    protected bool estavaNoChao = true;
    protected bool podePular;
    protected float velocidadeFowardDesejada;                   //Quao rapido o jogador pretende ir pela superficie baseado na entrada.
    protected float velocidadeFoward;                           //Quao rapido o jogador esta indo.
    protected float velocidadeVertical;
    [SerializeField]
    protected JogadorInputs input;
    [SerializeField]
    protected CharacterController charCtrl;
    [SerializeField]
    protected Animator animatorChar;
    protected Material superficeAtual;                          //Usado para fazer as decisoes de troca de audio de acordo com  terreno
    protected Quaternion rotacaoAlvo;                           //Qual é a rotação que o jogador pretende ter com base no Input.
    protected float GrausAngulo;                                //Ângulo em graus entre a rotação atual do jogador e a rotação do alvo.
    protected Collider[] CollidersAVolta = new Collider[8];     //Usado para armazenar em cache colliders que estão próximos ao jogador.
    protected bool Atacando;                                    //Se o jogador está atualmente no meio de um ataque corpo a corpo
    protected bool Combando;                                    //Se o jogador está atualmente no meio de seu combo melee.
    protected AreaDeDano ConsegueAtacar;                        //Referência utilizada para definir a invulnerabilidade e a saúde com base no respawning.
    protected Renderer[] Renderers;                             //Referências usadas para garantir que os Renderers sejam redefinidos corretamente.
    protected bool Respawnando;
    [SerializeField]
    protected float IdleTimer;                                  //Usado para contar até o jogador considerando uma ociosidade aleatória.

    //Essas constantes são usadas para garantir que o jogador se mova e se comporte adequadamente.
    //É aconselhável que não os altere sem entender completamente o que eles fazem no código.
    const float ProporcaoVelocidadeGiroNoAr = 5.4f;             //ProporcaoVelocidadeGiroNoAr
    const float DistanciaRaioDoChao = 1f;                       //DistanciaRaioDoChao
    const float ParaPuloVelocidade = 10f;
    const float MinEnemyDotCoeff = 0.2f;
    const float InverterUmACentoEoitenta = 1f / 180f;
    const float StickingGravidadeProporcional = 0.3f;
    const float AceleracaoChao = 20f;
    const float DesaceleracaoChao = 25f;

    // Parametros
    readonly int AnimVelocidadeVerticalNoAr = Animator.StringToHash("VelocidadeVerticalNoAr");
    readonly int AnimVelocidadeFoward = Animator.StringToHash("FowardVelocity");
    readonly int AnimAnguloDeltaRad = Animator.StringToHash("DeltaAnguloRadiano");
    readonly int AnimTempoIrParaIdle = Animator.StringToHash("IrParaIdles");
    readonly int AnimNoChao = Animator.StringToHash("NoChao");
    readonly int AnimDetectouInput = Animator.StringToHash("DetectarInput");
    readonly int AnimAtaqueMelee = Animator.StringToHash("AtaqueMelee");
    readonly int AnimLevouDano = Animator.StringToHash("LevouDano");
    readonly int AnimMorreuNormal = Animator.StringToHash("Morrer");
    readonly int AnimRespawnar = Animator.StringToHash("Respawnar");
    readonly int AnimLevarDanoX = Animator.StringToHash("LevarDanoX");
    readonly int AnimLevarDanoY = Animator.StringToHash("LevarDanoY");
    readonly int AnimTempoDeEstado = Animator.StringToHash("TempoDeEstado");
    readonly int AnimPeNoChao = Animator.StringToHash("FootFall");

    // States
    readonly int AnimMovimentacao = Animator.StringToHash("Movimentacao");
    readonly int AnimNoAr = Animator.StringToHash("NoAr");
    readonly int AnimAterissando = Animator.StringToHash("Aterrissando");    // Also a parameter.
    readonly int AnimCombo1 = Animator.StringToHash("Soco1");
    readonly int AnimCombo2 = Animator.StringToHash("Soco2");
    readonly int AnimCombo3 = Animator.StringToHash("Soco2");
    readonly int AnimMorte1 = Animator.StringToHash("Morte1");
    
    //Tags
    protected bool IsMoveInput
    {
        get { return !Mathf.Approximately(input.MoveInput.sqrMagnitude, 0f); }
    }

    //Chamado automaticamente pelo Unity quando o script é adicionado pela primeira vez a um objeto de jogo ou é redefinido no menu de contexto.
    void Reset()
    {
        //garrasMelee = GetComponentInChildren<GarrasMelee>();

        Transform footStepSource = transform.Find("FootstepSource");
        if (footStepSource != null)
            footstepPlayer = footStepSource.GetComponent<PlayerDeAudioRandomico>();

        Transform hurtSource = transform.Find("HurtSource");
        if (hurtSource != null)
            hurtAudioPlayer = hurtSource.GetComponent<PlayerDeAudioRandomico>();

        Transform landingSource = transform.Find("LandingSource");
        if (landingSource != null)
            landingPlayer = landingSource.GetComponent<PlayerDeAudioRandomico>();

        cameraSettings = FindObjectOfType<CameraSettings>();

        if (cameraSettings != null)
        {
            if (cameraSettings.follow == null)
                cameraSettings.follow = transform;

            if (cameraSettings.lookAt == null)
                cameraSettings.follow = transform.Find("AlvoCabeca");
        }
    }

    // Chamado automaticamente pelo Unity quando o script existe pela primeira vez na cena.
    void Awake()
    {
        input = GetComponent<JogadorInputs>();
        animatorChar = GetComponent<Animator>();
        charCtrl = GetComponent<CharacterController>();

        //garrasMelee.SetOwner(gameObject);

        s_Instance = this;
    }

    

    void Start () {
		
	}

    // Update é chamado uma vez por frame
    void Update () {
        
    }

    private void FixedUpdate()
    {
        CacheAnimatorState();
        animatorChar.SetFloat(AnimTempoDeEstado, Mathf.Repeat(animatorChar.GetCurrentAnimatorStateInfo(0).normalizedTime, 1f));

        CalculaMovimentoParaFrente();
        CalculaMovimentoVertical();

        SetTargetRotation();

        if (IsOrientationUpdated() && IsMoveInput)
            UpdateOrientation();

        TimeoutToIdle();

        estavaNoChao = noChao;
    }

    // Chamado no início do FixedUpdate para registrar o estado atual da camada base do animador.
    void CacheAnimatorState()
    {
        m_PreviousCurrentStateInfo = m_CurrentStateInfo;
        m_PreviousNextStateInfo = m_NextStateInfo;
        m_PreviousIsAnimatorTransitioning = m_IsAnimatorTransitioning;

        m_CurrentStateInfo = animatorChar.GetCurrentAnimatorStateInfo(0);
        m_NextStateInfo = animatorChar.GetNextAnimatorStateInfo(0);
        m_IsAnimatorTransitioning = animatorChar.IsInTransition(0);
    }


    void CalculaMovimentoParaFrente()
    {
        //Coloque em cache a entrada de movimento e limite sua magnitude em 1.
        Vector2 moveInput = input.MoveInput;
        if (moveInput.sqrMagnitude > 1f)
            moveInput.Normalize();

        // Calcule a velocidade pretendida pela entrada.
        velocidadeFowardDesejada = moveInput.magnitude * velocidadeMaximaFoward;

        // Determine a mudança para acelerar com base em se há alguma entrada de movimento no momento.
        float acceleration = IsMoveInput ? AceleracaoChao : DesaceleracaoChao;

        // Ajuste a velocidade de avanço para a velocidade desejada.
        velocidadeFoward = Mathf.MoveTowards(velocidadeFoward, velocidadeFowardDesejada, acceleration * Time.deltaTime);
        // Defina o parâmetro do animador para controlar qual animação está sendo reproduzida.
        animatorChar.SetFloat(AnimVelocidadeFoward, velocidadeFoward);
    }

    // Chamado cada passo da física.
    void CalculaMovimentoVertical()
    {
        // Se o salto não estiver no momento e Ellen estiver no chão, ela estará pronta para pular.
        if (!input.PuloInput && noChao)
            podePular = true;

        if (noChao)
        {
            // Quando aterrados aplicamos uma velocidade vertical ligeiramente negativa para fazer o jogador "grudar" no chão.
            // Isso corrige o charCtrl.isGrounded, fazendo com que ele retorce o valor true.
            velocidadeVertical = -gravidade * StickingGravidadeProporcional;

            // Se o pulo acontecer, O jogador está pronto para pular e não está no meio de uma combinação corpo-a-corpo ...
            if (input.PuloInput && podePular && !Combando)
            {
                // ... em seguida, anule a velocidade vertical definida anteriormente e certifique-se de que ela não possa pular novamente.
                //Fazer modificacao para que o jogador possa pular duas vezes
                velocidadeVertical = velocidadePulo;
                noChao = false;
                podePular = false;
            }
        }
        else
        {
            // Se o jogador estiver no ar, o botão de pulo não é segurado e o jogador está se movendo para cima ...
            if (!input.PuloInput && velocidadeVertical > 0.0f)
            {
                // ... diminui a velocidade vertical do jogador.
                // Isto é o que faz com que o salto de sustentação salte mais alto que o salto de pancada.
                velocidadeVertical -= ParaPuloVelocidade * Time.deltaTime;
            }

            // Se um salto estiver chegando ao máximo, torne-o absoluto.
            if (Mathf.Approximately(velocidadeVertical, 0f))
            {
                velocidadeVertical = 0f;
            }

            // Se o jogador estiver no ar, aplique a gravidade.
            velocidadeVertical -= gravidade * Time.deltaTime;
        }
    }

    void SetTargetRotation()
    {
        // Cria três variáveis, move a entrada local para o player, achata a direção para frente da câmera e uma rotação de destino local.
        Vector2 moveInput = input.MoveInput;
        Vector3 localMovementDirection = new Vector3(moveInput.x, 0f, moveInput.y).normalized;

        Vector3 forward = Quaternion.Euler(0f, cameraSettings.Current.m_XAxis.Value, 0f) * Vector3.forward;
        forward.y = 0f;
        forward.Normalize();

        Quaternion targetRotation;

        // Se a direção do movimento local for o oposto de frente, então a rotação do alvo deve estar voltada para a câmera.
        if (Mathf.Approximately(Vector3.Dot(localMovementDirection, Vector3.forward), -1.0f))
        {
            targetRotation = Quaternion.LookRotation(-forward);
        }
        else
        {
            // Caso contrário, a rotação deve ser o deslocamento da entrada do avanço da câmera.
            Quaternion cameraToInputOffset = Quaternion.FromToRotation(Vector3.forward, localMovementDirection);
            targetRotation = Quaternion.LookRotation(cameraToInputOffset * forward);
        }

        // A direção direta desejada do jogador.
        Vector3 resultingForward = targetRotation * Vector3.forward;

        Debug.Log(targetRotation);

        // Se atacar, tente orientar para a direcao dos inimigos.
        if (Atacando)
        {
            // Encontre todos os inimigos na área local.
            Vector3 centre = transform.position + transform.forward * 2.0f + transform.up;
            Vector3 halfExtents = new Vector3(3.0f, 1.0f, 2.0f);
            int layerMask = 1 << LayerMask.NameToLayer("Inimigo");
            int count = Physics.OverlapBoxNonAlloc(centre, halfExtents, CollidersAVolta, targetRotation, layerMask);

            // Passa por todos os inimigos na área local ...
            float closestDot = 0.0f;
            Vector3 closestForward = Vector3.zero;
            int closest = -1;

            for (int i = 0; i < count; ++i)
            {
                // ... e para cada um recebe um vetor do jogador para o inimigo.
                Vector3 playerToEnemy = CollidersAVolta[i].transform.position - transform.position;
                playerToEnemy.y = 0;
                playerToEnemy.Normalize();

                // Encontre o produto de pontos entre a direção que o jogador quer ir e a direção para o inimigo.
                // Isso será maior quanto mais próximo da direção desejada do jogador a direção do inimigo.
                float d = Vector3.Dot(resultingForward, playerToEnemy);

                // Armazene o inimigo mais próximo.
                if (d > MinEnemyDotCoeff && d > closestDot)
                {
                    closestForward = playerToEnemy;
                    closestDot = d;
                    closest = i;
                }
            }

            // Talvez seja substituido por um sistema melhor
            // Se houver um inimigo próximo ...
            if (closest != -1)
            {
                // O atacante desejado é a direção para o inimigo mais próximo.
                resultingForward = closestForward;

                // Também definimos a rotação diretamente, pois queremos que a luta e a orientação mal-intencionadas não sejam atualizadas na função UpdateOrientation durante um ataque.
                transform.rotation = Quaternion.LookRotation(resultingForward);
            }
        }

        // Encontre a diferença entre a rotação atual do jogador e a rotação desejada do jogador em radianos.
        float angleCurrent = Mathf.Atan2(transform.forward.x, transform.forward.z) * Mathf.Rad2Deg;
        float targetAngle = Mathf.Atan2(resultingForward.x, resultingForward.z) * Mathf.Rad2Deg;

        GrausAngulo = Mathf.DeltaAngle(angleCurrent, targetAngle);
        rotacaoAlvo = targetRotation;
    }

    // Chamado de cada passo da física para ajudar a determinar se o jogador pode se virar sob a entrada do jogador.
    bool IsOrientationUpdated()
    {
        bool updateOrientationForLocomotion = !m_IsAnimatorTransitioning && m_CurrentStateInfo.shortNameHash == AnimMovimentacao || m_NextStateInfo.shortNameHash == AnimMovimentacao;
        bool updateOrientationForAirborne = !m_IsAnimatorTransitioning && m_CurrentStateInfo.shortNameHash == AnimNoAr || m_NextStateInfo.shortNameHash == AnimNoAr;
        bool updateOrientationForLanding = !m_IsAnimatorTransitioning && m_CurrentStateInfo.shortNameHash == AnimAterissando || m_NextStateInfo.shortNameHash == AnimAterissando;

        return updateOrientationForLocomotion || updateOrientationForAirborne || updateOrientationForLanding || Combando && !Atacando;
    }

    // Chamado cada passo da física após SetTargetRotation, se houver movimento de entrada o jogador estiver no estado correto do animador, de acordo com IsOrientationUpdated.
    void UpdateOrientation()
    {
        animatorChar.SetFloat(AnimAnguloDeltaRad, GrausAngulo * Mathf.Deg2Rad);

        Vector3 localInput = new Vector3(input.MoveInput.x, 0f, input.MoveInput.y);
        float groundedTurnSpeed = Mathf.Lerp(velocidadeMaximaVirada, velocidadeMinimaVirada, velocidadeFoward / velocidadeFowardDesejada);
        float actualTurnSpeed = noChao ? groundedTurnSpeed : Vector3.Angle(transform.forward, localInput) * InverterUmACentoEoitenta * ProporcaoVelocidadeGiroNoAr * groundedTurnSpeed;
        rotacaoAlvo = Quaternion.RotateTowards(transform.rotation, rotacaoAlvo, actualTurnSpeed * Time.deltaTime);

        transform.rotation = rotacaoAlvo;
    }

    // Chamei cada passo da física para contar até o ponto em que Ellen considera uma ociosidade aleatória.
    void TimeoutToIdle()
    {
        bool inputDetected = IsMoveInput || input.AtaqueInput || input.PuloInput;
        if (noChao && !inputDetected)
        {
            IdleTimer += Time.deltaTime;

            if (IdleTimer >= idleTempoDeOciosidade)
            {
                IdleTimer = 0f;
                animatorChar.SetTrigger(AnimTempoIrParaIdle);
            }
        }
        else
        {
            IdleTimer = 0f;
            animatorChar.ResetTrigger(AnimTempoIrParaIdle);
        }

        animatorChar.SetBool(AnimDetectouInput, inputDetected);
    }

    void OnAnimatorMove()
    {
        Vector3 movement;

        // If se o jogador esta no chao...
        if (noChao)
        {
            // ... lança raycast em direcao ao chao...
            RaycastHit hit;
            Ray ray = new Ray(transform.position + Vector3.up * DistanciaRaioDoChao * 0.5f, -Vector3.up);
            if (Physics.Raycast(ray, out hit, DistanciaRaioDoChao, Physics.AllLayers, QueryTriggerInteraction.Ignore))
            {
                // Armazene também a superfície de caminhada atual para que o áudio correto seja reproduzido.
                movement = Vector3.ProjectOnPlane(animatorChar.deltaPosition, hit.normal);

                // Also store the current walking surface so the correct audio is played.
                Renderer groundRenderer = hit.collider.GetComponentInChildren<Renderer>();
                superficeAtual = groundRenderer ? groundRenderer.sharedMaterial : null;
            }
            else
            {
                // Se nenhum solo for atingido, apenas pegue o movimento como o movimento da raiz.
                // Teoricamente, isso raramente acontece, pois quando aterrado, o raio deve sempre acertar.
                movement = animatorChar.deltaPosition;
                superficeAtual = null;
            }
        }
        else
        {
            // Se não estiver aterrado, o movimento é apenas na direção para frente.
            // A movimentação aerea para os lados é definida atravez da rotação do eixo raiz do jogador durante o salto
            movement = velocidadeFoward * transform.forward * Time.deltaTime;
        }

        // Gira a transformação do character controller pela rotação da raiz da animação.
        charCtrl.transform.rotation *= animatorChar.deltaRotation;

        // Adicione ao movimento com a velocidade vertical calculada.
        movement += velocidadeVertical * Vector3.up * Time.deltaTime;

        // Move o character controller.
        charCtrl.Move(movement);

        // Após o movimento, armazene se o character controler está aterrado ou não.
        noChao = charCtrl.isGrounded;
        // Se o jogador não estiver no chão, envie a velocidade vertical para o animador.
        // É assim que a velocidade vertical é mantida durante o pouso para que a animação de pouso correta seja reproduzida.
        if (!noChao)
            animatorChar.SetFloat(AnimVelocidadeVerticalNoAr, velocidadeVertical);

        // Envie se o jogador está ou não no chão para o animador.
        animatorChar.SetBool(AnimNoChao, noChao);
    }

    public void RespawnAcabou()
    {
        Respawnando = false;
        //ConsegueAtacar.isInvulnerable = false;
    }
}
