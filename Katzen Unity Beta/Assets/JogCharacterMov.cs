using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[RequireComponent(typeof(CharacterController))]
[RequireComponent(typeof(Animator))]

public class JogCharacterMov : MonoBehaviour {
    protected static JogCharacterMov s_Instance;
    public static JogCharacterMov instance { get { return s_Instance; } }

    public enum Mode
    {
        AndarNormal = 0,
        AndarMirando = 1,
        Escorregar = 2
    }
    public Mode action = Mode.AndarNormal;

    public enum Combat
    {
        Garras = 0,
        Estilingue = 1
    }
    public Combat combate = Combat.Garras;

    [Header("Velocidades de Movimentacao")]
    [Range(0f, 20f)]
    [SerializeField]
    public float velocidadeCaminhadaFoward = 2f;
    [Range(0f, 20f)]
    [SerializeField]
    public float velocidadeNormalFoward = 8f;
    [Range(0f, 20f)]
    [SerializeField]
    public float velocidadeMaximaFoward = 15f;

    [Header("Velocidades de Saltos")]
    [Range(0f, 40f)]
    [SerializeField]
    public float gravidade = 20f;
    [Range(0f, 20f)]
    [SerializeField]
    public float velocidadePulo = 10f;
    [Range(100f, 600f)]
    [SerializeField]

    [Header("Velocidades de Viradas")]
    public float velocidadeMinimaVirada = 400f;
    [Range(500f, 1500f)]
    [SerializeField]
    public float velocidadeMaximaVirada = 1200f;

    [Header("Idles e Combate")]
    [Range(0f, 20f)]
    [SerializeField]
    public float idleTempoDeOciosidade = 5f;
    public bool podeAtacar;
    public bool podeUsarEstilingue;
    private int numPulos = 0;
    private int maxPulos = 1;

    public CameraSettings cameraSettings;
    public Transform cameraOrb;
    //public GarrasMelee garrasMelee;
    public PlayerDeAudioRandomico footstepPlayer;         // Random Audio Players used for various situations.
    public PlayerDeAudioRandomico hurtAudioPlayer;
    public PlayerDeAudioRandomico landingPlayer;
    public PlayerDeAudioRandomico emoteLandingPlayer;
    public PlayerDeAudioRandomico emoteDeathPlayer;
    public PlayerDeAudioRandomico emoteAttackPlayer;
    public PlayerDeAudioRandomico emoteJumpPlayer;

    [SerializeField]
    protected AnimatorStateInfo EstadoAtualInfo;            //Information about the base layer of the animator cached.
    [SerializeField]
    protected AnimatorStateInfo ProximoEstadoInfo;
    [SerializeField]
    protected bool AnimEstaEmTransicao;
    [SerializeField]
    protected AnimatorStateInfo EstadoAtualAnteriorInfo;    //Information about the base layer of the animator from last frame.
    [SerializeField]
    protected AnimatorStateInfo ProximoEstadoDoAnteriorInfo;
    [SerializeField]
    protected bool AnimAnteriorEstaEmAnimacao;
    protected bool noChao = true;
    protected bool estavaNoChao = true;
    protected bool podePular;
    protected bool pulou;
    protected float velocidadeFowardDesejada;                   //Quao rapido o jogador pretende ir pela superficie baseado na entrada.
    protected float velocidadeFoward;                           //Quao rapido o jogador esta indo.
    protected float velocidadeVertical;
    float angle;
    Vector2 ultimoMovimento;
    Vector3 movement;
    [SerializeField]
    protected JogadorInputs input;
    [SerializeField]
    protected CharacterController charCtrl;
    [SerializeField]
    protected Animator animatorChar;
    protected Animator animHUDArmas;
    protected Animator animEstilingue;
    public GameObject Estilingue;
    public GameObject HUDArmas;
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
    readonly int AnimAterissando = Animator.StringToHash("Aterrissando");    // Também é o parametro.
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

        if (Camera.main != null)
        {
            cameraOrb = Camera.main.transform;
        }
    }

    // Chamado automaticamente pelo Unity quando o script existe pela primeira vez na cena.
    void Awake()
    {
        if (Estilingue == null)
        {
            Estilingue = GameObject.Find("Estilingue_Animacoes_Root_Travado");
        }

        if (HUDArmas == null)
        {
            HUDArmas = GameObject.Find("ArmasHUD");
        }
        
        if (Camera.main != null)
        {
            cameraOrb = Camera.main.transform;
        }

        input = GetComponent<JogadorInputs>();
        animatorChar = GetComponent<Animator>();
        animEstilingue = Estilingue.GetComponent<Animator>();
        animHUDArmas = HUDArmas.GetComponent<Animator>();
        charCtrl = GetComponent<CharacterController>();

        //garrasMelee.SetOwner(gameObject);

        s_Instance = this;
    }
    
    void Start () {
		
	}

    // Update é chamado uma vez por frame
    void Update () {

        TrocarArmas();

        switch (combate)
        {
            case Combat.Estilingue:
                Mirar();
                break;
            case Combat.Garras:

                break;
        }
    }

    private void FixedUpdate()
    {
        CacheAnimatorState();
        animatorChar.SetFloat(AnimTempoDeEstado, Mathf.Repeat(animatorChar.GetCurrentAnimatorStateInfo(0).normalizedTime, 1f));

        switch (action)
        {
            case Mode.AndarNormal:
                CalculaMovimentoParaFrente();
                CalculaMovimentoVertical();

                SetTargetRotation();

                //if (IsOrientationUpdated() && IsMoveInput)
                if (IsMoveInput)
                {
                    CalculateDirection();
                    Rotate();
                }

                TimeoutToIdle();
                break;
            case Mode.AndarMirando:
                AnimatorControlWalk8Way();
                MoverMirando();
                CalculateDirectionMira();
                Rotate();
                break;
        }
        estavaNoChao = noChao;
    }

    // Chamado no início do FixedUpdate para registrar o estado atual da camada base do animador.
    void CacheAnimatorState()
    {
        EstadoAtualAnteriorInfo = EstadoAtualInfo;
        ProximoEstadoDoAnteriorInfo = ProximoEstadoInfo;
        AnimAnteriorEstaEmAnimacao = AnimEstaEmTransicao;

        EstadoAtualInfo = animatorChar.GetCurrentAnimatorStateInfo(0);
        ProximoEstadoInfo = animatorChar.GetNextAnimatorStateInfo(0);
        AnimEstaEmTransicao = animatorChar.IsInTransition(0);
    }


    void CalculaMovimentoParaFrente()
    {
        //Coloque em cache a entrada de movimento e limite sua magnitude em 1.
        Vector2 moveInput = input.MoveInput;
        if (moveInput.sqrMagnitude > 1f)
            moveInput.Normalize();

        // Calcule a velocidade pretendida pela entrada.
        if(input.CaminharInput && noChao)
        {
            velocidadeFowardDesejada = moveInput.magnitude * velocidadeCaminhadaFoward;
        }

        else if (input.CorrerInput && noChao)
        {
            velocidadeFowardDesejada = moveInput.magnitude * velocidadeMaximaFoward;
        }

        else
        {
            velocidadeFowardDesejada = moveInput.magnitude * velocidadeNormalFoward;
        }

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
        Vector2 moveInput = input.MoveInput;
        // Se o salto não estiver no momento e Ellen estiver no chão, ela estará pronta para pular.
        if (!input.PuloInput && noChao)
            podePular = true;

        if (noChao)
        {
            numPulos = 0;
            // Quando aterrados aplicamos uma velocidade vertical ligeiramente negativa para fazer o jogador "grudar" no chão.
            // Isso corrige o charCtrl.isGrounded, fazendo com que ele retorce o valor true.
            velocidadeVertical = -gravidade * StickingGravidadeProporcional;

            // Se o pulo acontecer, O jogador está pronto para pular e não está no meio de uma combinação corpo-a-corpo ...
            if (input.PuloInput && podePular && !Combando)
            {
                // ... em seguida, anule a velocidade vertical definida anteriormente e certifique-se de que ela não possa pular novamente.
                
                velocidadeVertical = velocidadePulo;
                noChao = false;
                podePular = false;
                pulou = true;
            }
        }
        else
        {
            // Se o jogador estiver no ar, o botão de pulo não é segurado e o jogador está se movendo para cima ...
            if (!input.PuloInput && velocidadeVertical > 0.0f)
            {
                // ... diminui a velocidade vertical do jogador.
                // Isto é o que faz com que o salto de sustentação salte mais alto que o salto de clique rapido. 
                //Faz com que o pulo varie de acordo com a pressão aplicada no botao de pulo.
                velocidadeVertical -= ParaPuloVelocidade * Time.deltaTime;
                pulou = false;
            }

            // Se um salto estiver chegando ao máximo, torne-o absoluto.
            if (Mathf.Approximately(velocidadeVertical, 0f))
            {
                velocidadeVertical = 0f;
            }
            // Se o jogador estiver no ar, aplique a gravidade.
            velocidadeVertical -= gravidade * Time.deltaTime;
            ultimoMovimento = moveInput;

            if (input.PuloInput && velocidadeVertical < 0.0f && !pulou && numPulos < maxPulos)
            {
                // ... em seguida, anule a velocidade vertical definida anteriormente e certifique-se de que ela não possa pular novamente.
                animatorChar.SetTrigger("PuloDuplo");
                velocidadeVertical = velocidadePulo;
                noChao = false;
                numPulos += 1;
                //podePular = false;
            }
        }
    }

    private void TrocarArmas()
    {
        if (input.TrocarArmaInput > 0)
        {
            animatorChar.SetLayerWeight(4, 1.0f);
            animHUDArmas.SetBool("Armado", true);
            combate = Combat.Estilingue;
            TrocadorArma();
        }

        if (input.TrocarArmaInput < 0)
        {
            animatorChar.SetLayerWeight(4, 1.0f);
            animHUDArmas.SetBool("Armado", false);
            combate = Combat.Garras;
            TrocadorArma();
        }
    }

    private void TrocadorArma()
    {
        if (combate == Combat.Garras)
        {
            animatorChar.SetBool("Armado", true);
            animatorChar.CrossFade("SacarEstilingue", Time.deltaTime);
        }

        if (combate == Combat.Estilingue)
        {
            animatorChar.SetBool("Armado", false);
            animatorChar.CrossFade("GuardarEstilingue", Time.deltaTime);
        }
    }

    public void Mirar()
    {
        if (input.MirarInput)
        {
            animatorChar.SetLayerWeight(1, 1.0f);
            animatorChar.SetLayerWeight(2, 1.0f);
            animatorChar.SetLayerWeight(3, 1.0f);
            animatorChar.SetLayerWeight(5, 1.0f);
            animEstilingue.SetBool("Mirar", true);
            animatorChar.SetBool("Mirar", true);
            action = Mode.AndarMirando;
        }

        if (!input.MirarInput)
        {
            animatorChar.SetLayerWeight(1, 0.0f);
            animatorChar.SetLayerWeight(2, 0.0f);
            animatorChar.SetLayerWeight(3, 0.0f);
            animatorChar.SetLayerWeight(5, 0.0f);
            animEstilingue.SetBool("Mirar", false);
            animatorChar.SetBool("Mirar", false);
            action = Mode.AndarNormal;
        }
    }

    public void zeraPesoLayerAim()
    {
        animatorChar.SetLayerWeight(1, 0.0f);
    }

    void CalculateDirection()
    {
        Vector2 moveInput = input.MoveInput;
        angle = Mathf.Atan2(moveInput.x, moveInput.y);
        angle = Mathf.Rad2Deg * angle;//converte para graus
        angle += cameraOrb.eulerAngles.y;
    }

    void CalculateDirectionMira()//Trava a mira do jogador para a direção da camera
    {
        //Relativa a rotação da camera
        angle = Mathf.Atan2(0, 0);
        angle = Mathf.Rad2Deg * angle;//converte para graus
        angle += cameraOrb.eulerAngles.y;
    }

    void Rotate()
    {
        Vector3 localInput;
        float groundedTurnSpeed;
        float actualTurnSpeed;
        switch (action)
        {
            case Mode.AndarNormal:
                animatorChar.SetFloat(AnimAnguloDeltaRad, GrausAngulo * Mathf.Deg2Rad);

                localInput = new Vector3(input.MoveInput.x, 0f, input.MoveInput.y);
                groundedTurnSpeed = Mathf.Lerp(velocidadeMaximaVirada, velocidadeMinimaVirada, velocidadeFoward / velocidadeFowardDesejada);
                actualTurnSpeed = noChao ? groundedTurnSpeed : Vector3.Angle(transform.forward, localInput) * InverterUmACentoEoitenta * ProporcaoVelocidadeGiroNoAr * groundedTurnSpeed;

                rotacaoAlvo = Quaternion.RotateTowards(transform.rotation, rotacaoAlvo, actualTurnSpeed * Time.deltaTime);

                transform.rotation = rotacaoAlvo;
                break;
            case Mode.AndarMirando:

                localInput = new Vector3(input.MoveInput.x, 0f, input.MoveInput.y);
                groundedTurnSpeed = Mathf.Lerp(velocidadeMaximaVirada, velocidadeMinimaVirada, velocidadeFoward / velocidadeFowardDesejada);
                actualTurnSpeed = noChao ? groundedTurnSpeed : Vector3.Angle(transform.forward, localInput) * InverterUmACentoEoitenta * ProporcaoVelocidadeGiroNoAr * groundedTurnSpeed;

                rotacaoAlvo = Quaternion.Euler(0, angle, 0);//converte para quaternion
                transform.rotation = Quaternion.Slerp(transform.rotation, rotacaoAlvo, actualTurnSpeed * Time.deltaTime);

                break;
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
        bool updateOrientationForLocomotion = !AnimEstaEmTransicao && EstadoAtualInfo.shortNameHash == AnimMovimentacao || ProximoEstadoInfo.shortNameHash == AnimMovimentacao;
        bool updateOrientationForAirborne = !AnimEstaEmTransicao && EstadoAtualInfo.shortNameHash == AnimNoAr || ProximoEstadoInfo.shortNameHash == AnimNoAr;
        bool updateOrientationForLanding = !AnimEstaEmTransicao && EstadoAtualInfo.shortNameHash == AnimAterissando || ProximoEstadoInfo.shortNameHash == AnimAterissando;

        return updateOrientationForLocomotion || updateOrientationForAirborne || updateOrientationForLanding || Combando && !Atacando;
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

    void AnimatorControlWalk8Way()
    {
        Vector3 localvelocity;
        localvelocity = transform.InverseTransformDirection(Vector3.forward);
        //animatorChar.SetFloat("velocity", localvelocity.z, 0.1f, Time.deltaTime);
        //animatorChar.SetFloat("MiraX", cameraGO.transform.rotation.x);
    }

    private void MoverMirando()
    {
        animatorChar.SetFloat("MoveX", input.MoveInput.x);
        animatorChar.SetFloat("MoveZ", input.MoveInput.y);
    }

    void OnAnimatorMove()
    {
        //Vector3 movement;

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

    //Ainda da para melhorar o wall jump
    void OnControllerColliderHit(ControllerColliderHit hit)
    {
        //if (hit.gameObject.tag == "WallJump" && !noChao)
        //{
        //    Debug.Log("WallJump");
        //}
        if (charCtrl.collisionFlags == CollisionFlags.Sides)
        {
            if (input.PuloInput)
            {
                Debug.DrawRay(hit.point, hit.normal, Color.red, 2.0f);
                movement = hit.normal * velocidadeFoward;
                movement.y = velocidadePulo;
            }
        }
    }
}
