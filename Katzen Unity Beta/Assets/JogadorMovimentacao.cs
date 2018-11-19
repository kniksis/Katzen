using System.Collections;
using System.Collections.Generic;
using Message;
using UnityEngine;

[RequireComponent(typeof(CharacterController))]
[RequireComponent(typeof(Animator))]

public class JogadorMovimentacao : MonoBehaviour
{
    protected static JogadorMovimentacao s_Instance;
    public static JogadorMovimentacao instance { get { return s_Instance; } }
    
    [Header("Velocidades de Movimentacao")]
    [Range(0f, 20f)]
    [SerializeField]
    public float velocidadeCaminhadaFoward = 2f;
    [Range(0f, 20f)] [SerializeField]
    public float velocidadeNormalFoward = 8f;
    [Range(0f, 20f)]
    [SerializeField]
    public float velocidadeMaximaFoward = 15f;
    [Range(0f, 40f)] [SerializeField]
    public float gravidade = 20f;
    [Range(0f, 20f)] [SerializeField]
    public float velocidadePulo = 10f;
    [Range(100f, 600f)] [SerializeField]
    public float velocidadeMinimaVirada = 400f;
    [Range(500f, 1500f)] [SerializeField]
    public float velocidadeMaximaVirada = 1200f;
    [Range(0f, 20f)] [SerializeField]
    public float idleTempoDeOciosidade = 5f;
    public bool podeAtacar;
    public bool podeUsarEstilingue;

    public CameraSettings cameraSettings;
    public GarrasMelee garrasMelee;
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
    protected JogadorInputs input;
    protected CharacterController charCtrl;
    protected Animator animatorChar;
    protected Material superficeAtual;                          //Usado para fazer as decisoes de troca de audio de acordo com  terreno
    protected Quaternion rotacaoAlvo;                           //Qual é a rotação que o jogador pretende ter com base no Input.
    protected float GrausAngulo;                                //Ângulo em graus entre a rotação atual do jogador e a rotação do alvo.
    protected Collider[] CollidersAVolta = new Collider[8];     //Usado para armazenar em cache colliders que estão próximos ao jogador.
    protected bool Atacando;                                    //Se o jogador está atualmente no meio de um ataque corpo a corpo
    protected bool Combando;                                    //Se o jogador está atualmente no meio de seu combo melee.
    protected AreaDeDano ConsegueAtacar;                        //Referência utilizada para definir a invulnerabilidade e a saúde com base no respawning.
    protected Renderer[] Renderers;                             //Referências usadas para garantir que os Renderers sejam redefinidos corretamente.
    [SerializeField]
    protected float IdleTimer;                                  //Usado para contar até o jogador considerando uma ociosidade aleatória.

    //Essas constantes são usadas para garantir que Ellen se mova e se comporte adequadamente.
    //É aconselhável que você não os altere sem entender completamente o que eles fazem no código.
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
    readonly int AnimTempoIrParaIdle = Animator.StringToHash("IrParaIdle");
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

    // Tags
    protected bool IsMoveInput
    {
        get { return !Mathf.Approximately(input.MoveInput.sqrMagnitude, 0f); }
    }

    public void SetCanAttack(bool canAttack)
    {
        this.podeAtacar = canAttack;
    }

    // Called automatically by Unity when the script is first added to a gameobject or is reset from the context menu.
    void Reset()
    {
        garrasMelee = GetComponentInChildren<GarrasMelee>();

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

    // Called automatically by Unity when the script first exists in the scene.
    void Awake()
    {
        input = GetComponent<JogadorInputs>();
        animatorChar = GetComponent<Animator>();
        charCtrl = GetComponent<CharacterController>();

        //garrasMelee.SetOwner(gameObject);

        s_Instance = this;
    }

    // Called automatically by Unity after Awake whenever the script is enabled. 
    void OnEnable()
    {
        SceneLinkedSMB<JogadorMovimentacao>.Initialise(animatorChar, this);

        //ConsegueAtacar = GetComponent<AreaDeDano>();
        //ConsegueAtacar.onDamageMessageReceivers.Add(this);

        //ConsegueAtacar.isInvulnerable = true;

        //EquipMeleeWeapon(false);

        Renderers = GetComponentsInChildren<Renderer>();
    }

    // Called automatically by Unity whenever the script is disabled.
    void OnDisable()
    {
        //ConsegueAtacar.onDamageMessageReceivers.Remove(this);

        for (int i = 0; i < Renderers.Length; ++i)
        {
            Renderers[i].enabled = true;
        }
    }

    // Called automatically by Unity once every Physics step.
    void FixedUpdate()
    {
        CacheAnimatorState();
        EquipMeleeWeapon(IsWeaponEquiped());

        animatorChar.SetFloat(AnimTempoDeEstado, Mathf.Repeat(animatorChar.GetCurrentAnimatorStateInfo(0).normalizedTime, 1f));
        animatorChar.ResetTrigger(AnimAtaqueMelee);

        if (input.AtaqueInput && podeAtacar)
            animatorChar.SetTrigger(AnimAtaqueMelee);

        CalculateForwardMovement();
        CalculateVerticalMovement();

        SetTargetRotation();

        if (IsOrientationUpdated() && IsMoveInput)
            UpdateOrientation();

        PlayAudio();

        TimeoutToIdle();

        estavaNoChao = noChao;
    }

    // Called at the start of FixedUpdate to record the current state of the base layer of the animator.
    void CacheAnimatorState()
    {
        m_PreviousCurrentStateInfo = m_CurrentStateInfo;
        m_PreviousNextStateInfo = m_NextStateInfo;
        m_PreviousIsAnimatorTransitioning = m_IsAnimatorTransitioning;

        m_CurrentStateInfo = animatorChar.GetCurrentAnimatorStateInfo(0);
        m_NextStateInfo = animatorChar.GetNextAnimatorStateInfo(0);
        m_IsAnimatorTransitioning = animatorChar.IsInTransition(0);
    }

    // Called after the animator state has been cached to determine whether this script should block user input.
    // Called after the animator state has been cached to determine whether or not the staff should be active or not.
    bool IsWeaponEquiped()
    {
        bool equipped = m_NextStateInfo.shortNameHash == AnimCombo1 || m_CurrentStateInfo.shortNameHash == AnimCombo1;
        equipped |= m_NextStateInfo.shortNameHash == AnimCombo2 || m_CurrentStateInfo.shortNameHash == AnimCombo2;
        equipped |= m_NextStateInfo.shortNameHash == AnimCombo3 || m_CurrentStateInfo.shortNameHash == AnimCombo3;

        return equipped;
    }

    // Called each physics step with a parameter based on the return value of IsWeaponEquiped.
    void EquipMeleeWeapon(bool equip)
    {
        garrasMelee.gameObject.SetActive(equip);
        Atacando = false;
        Combando = equip;

        if (!equip)
            animatorChar.ResetTrigger(AnimAtaqueMelee);
    }

    // Called each physics step.
    void CalculateForwardMovement()
    {
        // Cache the move input and cap it's magnitude at 1.
        Vector2 moveInput = input.MoveInput;
        if (moveInput.sqrMagnitude > 1f)
            moveInput.Normalize();

        // Calculate the speed intended by input.
        velocidadeFowardDesejada = moveInput.magnitude * velocidadeNormalFoward;

        // Determine change to speed based on whether there is currently any move input.
        float acceleration = IsMoveInput ? AceleracaoChao : DesaceleracaoChao;

        // Adjust the forward speed towards the desired speed.
        velocidadeFoward = Mathf.MoveTowards(velocidadeFoward, velocidadeFowardDesejada, acceleration * Time.deltaTime);

        // Set the animator parameter to control what animation is being played.
        animatorChar.SetFloat(AnimVelocidadeFoward, velocidadeFoward);
    }

    // Called each physics step.
    void CalculateVerticalMovement()
    {
        // If jump is not currently held and Ellen is on the ground then she is ready to jump.
        if (!input.PuloInput && noChao)
            podePular = true;

        if (noChao)
        {
            // When grounded we apply a slight negative vertical speed to make Ellen "stick" to the ground.
            velocidadeVertical = -gravidade * StickingGravidadeProporcional;

            // If jump is held, Ellen is ready to jump and not currently in the middle of a melee combo...
            if (input.PuloInput && podePular && !Combando)
            {
                // ... then override the previously set vertical speed and make sure she cannot jump again.
                velocidadeVertical = velocidadePulo;
                noChao = false;
                podePular = false;
            }
        }
        else
        {
            // If Ellen is airborne, the jump button is not held and Ellen is currently moving upwards...
            if (!input.PuloInput && velocidadeVertical > 0.0f)
            {
                // ... decrease Ellen's vertical speed.
                // This is what causes holding jump to jump higher that tapping jump.
                velocidadeVertical -= ParaPuloVelocidade * Time.deltaTime;
            }

            // If a jump is approximately peaking, make it absolute.
            if (Mathf.Approximately(velocidadeVertical, 0f))
            {
                velocidadeVertical = 0f;
            }

            // If Ellen is airborne, apply gravity.
            velocidadeVertical -= gravidade * Time.deltaTime;
        }
    }

    // Called each physics step to set the rotation Ellen is aiming to have.
    void SetTargetRotation()
    {
        // Create three variables, move input local to the player, flattened forward direction of the camera and a local target rotation.
        Vector2 moveInput = input.MoveInput;
        Vector3 localMovementDirection = new Vector3(moveInput.x, 0f, moveInput.y).normalized;

        Vector3 forward = Quaternion.Euler(0f, cameraSettings.Current.m_XAxis.Value, 0f) * Vector3.forward;
        forward.y = 0f;
        forward.Normalize();

        Quaternion targetRotation;

        // If the local movement direction is the opposite of forward then the target rotation should be towards the camera.
        if (Mathf.Approximately(Vector3.Dot(localMovementDirection, Vector3.forward), -1.0f))
        {
            targetRotation = Quaternion.LookRotation(-forward);
        }
        else
        {
            // Otherwise the rotation should be the offset of the input from the camera's forward.
            Quaternion cameraToInputOffset = Quaternion.FromToRotation(Vector3.forward, localMovementDirection);
            targetRotation = Quaternion.LookRotation(cameraToInputOffset * forward);
        }

        // The desired forward direction of Ellen.
        Vector3 resultingForward = targetRotation * Vector3.forward;

        // If attacking try to orient to close enemies.
        if (Atacando)
        {
            // Find all the enemies in the local area.
            Vector3 centre = transform.position + transform.forward * 2.0f + transform.up;
            Vector3 halfExtents = new Vector3(3.0f, 1.0f, 2.0f);
            int layerMask = 1 << LayerMask.NameToLayer("Enemy");
            int count = Physics.OverlapBoxNonAlloc(centre, halfExtents, CollidersAVolta, targetRotation, layerMask);

            // Go through all the enemies in the local area...
            float closestDot = 0.0f;
            Vector3 closestForward = Vector3.zero;
            int closest = -1;

            for (int i = 0; i < count; ++i)
            {
                // ... and for each get a vector from the player to the enemy.
                Vector3 playerToEnemy = CollidersAVolta[i].transform.position - transform.position;
                playerToEnemy.y = 0;
                playerToEnemy.Normalize();

                // Find the dot product between the direction the player wants to go and the direction to the enemy.
                // This will be larger the closer to Ellen's desired direction the direction to the enemy is.
                float d = Vector3.Dot(resultingForward, playerToEnemy);

                // Store the closest enemy.
                if (d > MinEnemyDotCoeff && d > closestDot)
                {
                    closestForward = playerToEnemy;
                    closestDot = d;
                    closest = i;
                }
            }

            // If there is a close enemy...
            if (closest != -1)
            {
                // The desired forward is the direction to the closest enemy.
                resultingForward = closestForward;

                // We also directly set the rotation, as we want snappy fight and orientation isn't updated in the UpdateOrientation function during an atatck.
                transform.rotation = Quaternion.LookRotation(resultingForward);
            }
        }

        // Find the difference between the current rotation of the player and the desired rotation of the player in radians.
        float angleCurrent = Mathf.Atan2(transform.forward.x, transform.forward.z) * Mathf.Rad2Deg;
        float targetAngle = Mathf.Atan2(resultingForward.x, resultingForward.z) * Mathf.Rad2Deg;

        GrausAngulo = Mathf.DeltaAngle(angleCurrent, targetAngle);
        rotacaoAlvo = targetRotation;
    }

    // Called each physics step to help determine whether Ellen can turn under player input.
    bool IsOrientationUpdated()
    {
        bool updateOrientationForLocomotion = !m_IsAnimatorTransitioning && m_CurrentStateInfo.shortNameHash == AnimMovimentacao || m_NextStateInfo.shortNameHash == AnimMovimentacao;
        bool updateOrientationForAirborne = !m_IsAnimatorTransitioning && m_CurrentStateInfo.shortNameHash == AnimNoAr || m_NextStateInfo.shortNameHash == AnimNoAr;
        bool updateOrientationForLanding = !m_IsAnimatorTransitioning && m_CurrentStateInfo.shortNameHash == AnimAterissando || m_NextStateInfo.shortNameHash == AnimAterissando;

        return updateOrientationForLocomotion || updateOrientationForAirborne || updateOrientationForLanding || Combando && !Atacando;
    }

    // Called each physics step after SetTargetRotation if there is move input and Ellen is in the correct animator state according to IsOrientationUpdated.
    void UpdateOrientation()
    {
        animatorChar.SetFloat(AnimAnguloDeltaRad, GrausAngulo * Mathf.Deg2Rad);

        Vector3 localInput = new Vector3(input.MoveInput.x, 0f, input.MoveInput.y);
        float groundedTurnSpeed = Mathf.Lerp(velocidadeMaximaVirada, velocidadeMinimaVirada, velocidadeFoward / velocidadeFowardDesejada);
        float actualTurnSpeed = noChao ? groundedTurnSpeed : Vector3.Angle(transform.forward, localInput) * InverterUmACentoEoitenta * ProporcaoVelocidadeGiroNoAr * groundedTurnSpeed;
        rotacaoAlvo = Quaternion.RotateTowards(transform.rotation, rotacaoAlvo, actualTurnSpeed * Time.deltaTime);

        transform.rotation = rotacaoAlvo;
    }

    // Called each physics step to check if audio should be played and if so instruct the relevant random audio player to do so.
    void PlayAudio()
    {
        float footfallCurve = animatorChar.GetFloat(AnimPeNoChao);

        if (footfallCurve > 0.01f && !footstepPlayer.playing && footstepPlayer.canPlay)
        {
            footstepPlayer.playing = true;
            footstepPlayer.canPlay = false;
            footstepPlayer.PlayRandomClip(superficeAtual, velocidadeFoward < 4 ? 0 : 1);
        }
        else if (footstepPlayer.playing)
        {
            footstepPlayer.playing = false;
        }
        else if (footfallCurve < 0.01f && !footstepPlayer.canPlay)
        {
            footstepPlayer.canPlay = true;
        }

        if (noChao && !estavaNoChao)
        {
            landingPlayer.PlayRandomClip(superficeAtual, bankId: velocidadeFoward < 4 ? 0 : 1);
            emoteLandingPlayer.PlayRandomClip();
        }

        if (!noChao && estavaNoChao && velocidadeVertical > 0f)
        {
            emoteJumpPlayer.PlayRandomClip();
        }

        if (m_CurrentStateInfo.shortNameHash == AnimLevouDano && m_PreviousCurrentStateInfo.shortNameHash != AnimLevouDano)
        {
            hurtAudioPlayer.PlayRandomClip();
        }

        if (m_CurrentStateInfo.shortNameHash == AnimMorte1 && m_PreviousCurrentStateInfo.shortNameHash != AnimMorte1)
        {
            emoteDeathPlayer.PlayRandomClip();
        }

        if (m_CurrentStateInfo.shortNameHash == AnimCombo1 && m_PreviousCurrentStateInfo.shortNameHash != AnimCombo1 ||
            m_CurrentStateInfo.shortNameHash == AnimCombo2 && m_PreviousCurrentStateInfo.shortNameHash != AnimCombo2 ||
            m_CurrentStateInfo.shortNameHash == AnimCombo3 && m_PreviousCurrentStateInfo.shortNameHash != AnimCombo3)    
        {
            emoteAttackPlayer.PlayRandomClip();
        }
    }

    // Called each physics step to count up to the point where Ellen considers a random idle.
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

    // Called each physics step (so long as the Animator component is set to Animate Physics) after FixedUpdate to override root motion.
    void OnAnimatorMove()
    {
        Vector3 movement;

        // If Ellen is on the ground...
        if (noChao)
        {
            // ... raycast into the ground...
            RaycastHit hit;
            Ray ray = new Ray(transform.position + Vector3.up * DistanciaRaioDoChao * 0.5f, -Vector3.up);
            if (Physics.Raycast(ray, out hit, DistanciaRaioDoChao, Physics.AllLayers, QueryTriggerInteraction.Ignore))
            {
                // ... and get the movement of the root motion rotated to lie along the plane of the ground.
                movement = Vector3.ProjectOnPlane(animatorChar.deltaPosition, hit.normal);

                // Also store the current walking surface so the correct audio is played.
                Renderer groundRenderer = hit.collider.GetComponentInChildren<Renderer>();
                superficeAtual = groundRenderer ? groundRenderer.sharedMaterial : null;
            }
            else
            {
                // If no ground is hit just get the movement as the root motion.
                // Theoretically this should rarely happen as when grounded the ray should always hit.
                movement = animatorChar.deltaPosition;
                superficeAtual = null;
            }
        }
        else
        {
            // If not grounded the movement is just in the forward direction.
            movement = velocidadeFoward * transform.forward * Time.deltaTime;
        }

        // Rotate the transform of the character controller by the animation's root rotation.
        charCtrl.transform.rotation *= animatorChar.deltaRotation;

        // Add to the movement with the calculated vertical speed.
        movement += velocidadeVertical * Vector3.up * Time.deltaTime;

        // Move the character controller.
        charCtrl.Move(movement);

        // After the movement store whether or not the character controller is grounded.
        noChao = charCtrl.isGrounded;

        // If Ellen is not on the ground then send the vertical speed to the animator.
        // This is so the vertical speed is kept when landing so the correct landing animation is played.
        if (!noChao)
            animatorChar.SetFloat(AnimVelocidadeVerticalNoAr, velocidadeVertical);

        // Send whether or not Ellen is on the ground to the animator.
        animatorChar.SetBool(AnimNoChao, noChao);
    }

    // This is called by an animation event when Ellen swings her staff.
    public void MeleeAttackStart(int throwing = 0)
    {
        garrasMelee.BeginAttack(throwing != 0);
        Atacando = true;
    }

    // This is called by an animation event when Ellen finishes swinging her staff.
    public void MeleeAttackEnd()
    {
        garrasMelee.EndAttack();
        Atacando = false;
    }
    // Called by a state machine behaviour on Ellen's animator controller.
    
    // Called by Ellen's Damageable when she is hurt.
    public void OnReceiveMessage(MessageType type, object sender, object data)
    {
        switch (type)
        {
            case MessageType.DAMAGED:
                {
                    AreaDeDano.DamageMessage damageData = (AreaDeDano.DamageMessage)data;
                    Damaged(damageData);
                }
                break;
            case MessageType.DEAD:
                {
                    AreaDeDano.DamageMessage damageData = (AreaDeDano.DamageMessage)data;
                    Die(damageData);
                }
                break;
        }
    }

    // Called by OnReceiveMessage.
    void Damaged(AreaDeDano.DamageMessage damageMessage)
    {
        // Set the Hurt parameter of the animator.
        animatorChar.SetTrigger(AnimLevouDano);

        // Find the direction of the damage.
        Vector3 forward = damageMessage.damageSource - transform.position;
        forward.y = 0f;

        Vector3 localHurt = transform.InverseTransformDirection(forward);

        // Set the HurtFromX and HurtFromY parameters of the animator based on the direction of the damage.
        animatorChar.SetFloat(AnimLevarDanoX, localHurt.x);
        animatorChar.SetFloat(AnimLevarDanoY, localHurt.z);

        // Shake the camera.
        CameraShake.Shake(CameraShake.k_PlayerHitShakeAmount, CameraShake.k_PlayerHitShakeTime);

        // Play an audio clip of being hurt.
        if (hurtAudioPlayer != null)
        {
            hurtAudioPlayer.PlayRandomClip();
        }
    }

    // Called by OnReceiveMessage and by DeathVolumes in the scene.
    public void Die(AreaDeDano.DamageMessage damageMessage)
    {
        animatorChar.SetTrigger(AnimMorreuNormal);
        velocidadeFoward = 0f;
        velocidadeVertical = 0f;
        ConsegueAtacar.isInvulnerable = true;
    }
}