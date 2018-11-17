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
    [Range(0f, 20f)] [SerializeField]
    public float velocidadeMaximaFoward = 8f;
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

    protected AnimatorStateInfo m_CurrentStateInfo;    // Information about the base layer of the animator cached.
    protected AnimatorStateInfo m_NextStateInfo;
    protected bool m_IsAnimatorTransitioning;
    protected AnimatorStateInfo m_PreviousCurrentStateInfo;    // Information about the base layer of the animator from last frame.
    protected AnimatorStateInfo m_PreviousNextStateInfo;
    protected bool m_PreviousIsAnimatorTransitioning;
    protected bool noChao = true;
    protected bool estavaNoChao = true;
    protected bool podePular;
    protected float velocidadeFowardDesejada;         //Quao rapido o jogador pretende ir pela superficie baseado na entrada.
    protected float velocidadeFoward;                //Quao rapido o jogador esta indo.
    protected float velocidadeVertical;               // How fast Ellen is currently moving up or down.
    protected JogadorInputs input;                 // Reference used to determine how Ellen should move.
    protected CharacterController charCtrl;      // Reference used to actually move Ellen.
    protected Animator animator;                 // Reference used to make decisions based on Ellen's current animation and to set parameters.
    protected Material superficeAtual;    // Reference used to make decisions about audio.
    protected Quaternion rotacaoAlvo;         // What rotation Ellen is aiming to have based on input.
    protected float m_AngleDiff;                   // Angle in degrees between Ellen's current rotation and her target rotation.
    protected Collider[] m_OverlapResult = new Collider[8];    // Used to cache colliders that are near Ellen.
    protected bool m_InAttack;                     // Whether Ellen is currently in the middle of a melee attack.
    protected bool m_InCombo;                      // Whether Ellen is currently in the middle of her melee combo.
    protected AreaDeDano m_Damageable;             // Reference used to set invulnerablity and health based on respawning.
    protected Renderer[] m_Renderers;              // References used to make sure Renderers are reset properly. 
    protected Checkpoint m_CurrentCheckpoint;      // Reference used to reset Ellen to the correct position on respawn.
    [SerializeField]
    protected bool m_Respawning;                   // Whether Ellen is currently respawning.
    protected float m_IdleTimer;                   // Used to count up to Ellen considering a random idle.

    // These constants are used to ensure Ellen moves and behaves properly.
    // It is advised you don't change them without fully understanding what they do in code.
    const float k_AirborneTurnSpeedProportion = 5.4f;
    const float k_GroundedRayDistance = 1f;
    const float k_JumpAbortSpeed = 10f;
    const float k_MinEnemyDotCoeff = 0.2f;
    const float k_InverseOneEighty = 1f / 180f;
    const float k_StickingGravityProportion = 0.3f;
    const float k_GroundAcceleration = 20f;
    const float k_GroundDeceleration = 25f;

    // Parameters

    readonly int m_HashAirborneVerticalSpeed = Animator.StringToHash("VelocidadeVerticalNoAr");
    readonly int m_HashForwardSpeed = Animator.StringToHash("FowardVelocity");
    readonly int m_HashAngleDeltaRad = Animator.StringToHash("DeltaAnguloRadiano");
    readonly int m_HashTimeoutToIdle = Animator.StringToHash("IrParaIdle");
    readonly int m_HashGrounded = Animator.StringToHash("NoChao");
    readonly int m_HashInputDetected = Animator.StringToHash("InputDetected");
    readonly int m_HashMeleeAttack = Animator.StringToHash("AtaqueMelee");
    readonly int m_HashHurt = Animator.StringToHash("LevouDano");
    readonly int m_HashDeath = Animator.StringToHash("Morrer");
    readonly int m_HashRespawn = Animator.StringToHash("Respawnar");
    readonly int m_HashHurtFromX = Animator.StringToHash("LevarDanoX");
    readonly int m_HashHurtFromY = Animator.StringToHash("LevarDanoY");
    readonly int m_HashStateTime = Animator.StringToHash("TempoDeEstado");
    readonly int m_HashFootFall = Animator.StringToHash("FootFall");

    // States
    readonly int m_HashLocomotion = Animator.StringToHash("Movimentacao");
    readonly int m_HashAirborne = Animator.StringToHash("NoAr");
    readonly int m_HashLanding = Animator.StringToHash("Aterrissando");    // Also a parameter.
    readonly int m_HashEllenCombo1 = Animator.StringToHash("Soco1");
    readonly int m_HashEllenCombo2 = Animator.StringToHash("Soco2");
    readonly int m_HashEllenCombo3 = Animator.StringToHash("Soco2");
    readonly int m_HashEllenDeath = Animator.StringToHash("Morte1");

    // Tags
    readonly int m_HashBlockInput = Animator.StringToHash("BloquearControles");

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
        animator = GetComponent<Animator>();
        charCtrl = GetComponent<CharacterController>();

        garrasMelee.SetOwner(gameObject);

        s_Instance = this;
    }

    // Called automatically by Unity after Awake whenever the script is enabled. 
    void OnEnable()
    {
        SceneLinkedSMB<JogadorMovimentacao>.Initialise(animator, this);

        m_Damageable = GetComponent<AreaDeDano>();
        m_Damageable.onDamageMessageReceivers.Add(this);

        m_Damageable.isInvulnerable = true;

        EquipMeleeWeapon(false);

        m_Renderers = GetComponentsInChildren<Renderer>();
    }

    // Called automatically by Unity whenever the script is disabled.
    void OnDisable()
    {
        m_Damageable.onDamageMessageReceivers.Remove(this);

        for (int i = 0; i < m_Renderers.Length; ++i)
        {
            m_Renderers[i].enabled = true;
        }
    }

    // Called automatically by Unity once every Physics step.
    void FixedUpdate()
    {
        CacheAnimatorState();

        UpdateInputBlocking();

        EquipMeleeWeapon(IsWeaponEquiped());

        animator.SetFloat(m_HashStateTime, Mathf.Repeat(animator.GetCurrentAnimatorStateInfo(0).normalizedTime, 1f));
        animator.ResetTrigger(m_HashMeleeAttack);

        if (input.AtaqueInput && podeAtacar)
            animator.SetTrigger(m_HashMeleeAttack);

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

        m_CurrentStateInfo = animator.GetCurrentAnimatorStateInfo(0);
        m_NextStateInfo = animator.GetNextAnimatorStateInfo(0);
        m_IsAnimatorTransitioning = animator.IsInTransition(0);
    }

    // Called after the animator state has been cached to determine whether this script should block user input.
    void UpdateInputBlocking()
    {
        bool inputBlocked = m_CurrentStateInfo.tagHash == m_HashBlockInput && !m_IsAnimatorTransitioning;
        inputBlocked |= m_NextStateInfo.tagHash == m_HashBlockInput;
        input.JogadorInputsBloqueados = inputBlocked;
    }

    // Called after the animator state has been cached to determine whether or not the staff should be active or not.
    bool IsWeaponEquiped()
    {
        bool equipped = m_NextStateInfo.shortNameHash == m_HashEllenCombo1 || m_CurrentStateInfo.shortNameHash == m_HashEllenCombo1;
        equipped |= m_NextStateInfo.shortNameHash == m_HashEllenCombo2 || m_CurrentStateInfo.shortNameHash == m_HashEllenCombo2;
        equipped |= m_NextStateInfo.shortNameHash == m_HashEllenCombo3 || m_CurrentStateInfo.shortNameHash == m_HashEllenCombo3;

        return equipped;
    }

    // Called each physics step with a parameter based on the return value of IsWeaponEquiped.
    void EquipMeleeWeapon(bool equip)
    {
        garrasMelee.gameObject.SetActive(equip);
        m_InAttack = false;
        m_InCombo = equip;

        if (!equip)
            animator.ResetTrigger(m_HashMeleeAttack);
    }

    // Called each physics step.
    void CalculateForwardMovement()
    {
        // Cache the move input and cap it's magnitude at 1.
        Vector2 moveInput = input.MoveInput;
        if (moveInput.sqrMagnitude > 1f)
            moveInput.Normalize();

        // Calculate the speed intended by input.
        velocidadeFowardDesejada = moveInput.magnitude * velocidadeMaximaFoward;

        // Determine change to speed based on whether there is currently any move input.
        float acceleration = IsMoveInput ? k_GroundAcceleration : k_GroundDeceleration;

        // Adjust the forward speed towards the desired speed.
        velocidadeFoward = Mathf.MoveTowards(velocidadeFoward, velocidadeFowardDesejada, acceleration * Time.deltaTime);

        // Set the animator parameter to control what animation is being played.
        animator.SetFloat(m_HashForwardSpeed, velocidadeFoward);
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
            velocidadeVertical = -gravidade * k_StickingGravityProportion;

            // If jump is held, Ellen is ready to jump and not currently in the middle of a melee combo...
            if (input.PuloInput && podePular && !m_InCombo)
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
                velocidadeVertical -= k_JumpAbortSpeed * Time.deltaTime;
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
        if (m_InAttack)
        {
            // Find all the enemies in the local area.
            Vector3 centre = transform.position + transform.forward * 2.0f + transform.up;
            Vector3 halfExtents = new Vector3(3.0f, 1.0f, 2.0f);
            int layerMask = 1 << LayerMask.NameToLayer("Enemy");
            int count = Physics.OverlapBoxNonAlloc(centre, halfExtents, m_OverlapResult, targetRotation, layerMask);

            // Go through all the enemies in the local area...
            float closestDot = 0.0f;
            Vector3 closestForward = Vector3.zero;
            int closest = -1;

            for (int i = 0; i < count; ++i)
            {
                // ... and for each get a vector from the player to the enemy.
                Vector3 playerToEnemy = m_OverlapResult[i].transform.position - transform.position;
                playerToEnemy.y = 0;
                playerToEnemy.Normalize();

                // Find the dot product between the direction the player wants to go and the direction to the enemy.
                // This will be larger the closer to Ellen's desired direction the direction to the enemy is.
                float d = Vector3.Dot(resultingForward, playerToEnemy);

                // Store the closest enemy.
                if (d > k_MinEnemyDotCoeff && d > closestDot)
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

        m_AngleDiff = Mathf.DeltaAngle(angleCurrent, targetAngle);
        rotacaoAlvo = targetRotation;
    }

    // Called each physics step to help determine whether Ellen can turn under player input.
    bool IsOrientationUpdated()
    {
        bool updateOrientationForLocomotion = !m_IsAnimatorTransitioning && m_CurrentStateInfo.shortNameHash == m_HashLocomotion || m_NextStateInfo.shortNameHash == m_HashLocomotion;
        bool updateOrientationForAirborne = !m_IsAnimatorTransitioning && m_CurrentStateInfo.shortNameHash == m_HashAirborne || m_NextStateInfo.shortNameHash == m_HashAirborne;
        bool updateOrientationForLanding = !m_IsAnimatorTransitioning && m_CurrentStateInfo.shortNameHash == m_HashLanding || m_NextStateInfo.shortNameHash == m_HashLanding;

        return updateOrientationForLocomotion || updateOrientationForAirborne || updateOrientationForLanding || m_InCombo && !m_InAttack;
    }

    // Called each physics step after SetTargetRotation if there is move input and Ellen is in the correct animator state according to IsOrientationUpdated.
    void UpdateOrientation()
    {
        animator.SetFloat(m_HashAngleDeltaRad, m_AngleDiff * Mathf.Deg2Rad);

        Vector3 localInput = new Vector3(input.MoveInput.x, 0f, input.MoveInput.y);
        float groundedTurnSpeed = Mathf.Lerp(velocidadeMaximaVirada, velocidadeMinimaVirada, velocidadeFoward / velocidadeFowardDesejada);
        float actualTurnSpeed = noChao ? groundedTurnSpeed : Vector3.Angle(transform.forward, localInput) * k_InverseOneEighty * k_AirborneTurnSpeedProportion * groundedTurnSpeed;
        rotacaoAlvo = Quaternion.RotateTowards(transform.rotation, rotacaoAlvo, actualTurnSpeed * Time.deltaTime);

        transform.rotation = rotacaoAlvo;
    }

    // Called each physics step to check if audio should be played and if so instruct the relevant random audio player to do so.
    void PlayAudio()
    {
        float footfallCurve = animator.GetFloat(m_HashFootFall);

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

        if (m_CurrentStateInfo.shortNameHash == m_HashHurt && m_PreviousCurrentStateInfo.shortNameHash != m_HashHurt)
        {
            hurtAudioPlayer.PlayRandomClip();
        }

        if (m_CurrentStateInfo.shortNameHash == m_HashEllenDeath && m_PreviousCurrentStateInfo.shortNameHash != m_HashEllenDeath)
        {
            emoteDeathPlayer.PlayRandomClip();
        }

        if (m_CurrentStateInfo.shortNameHash == m_HashEllenCombo1 && m_PreviousCurrentStateInfo.shortNameHash != m_HashEllenCombo1 ||
            m_CurrentStateInfo.shortNameHash == m_HashEllenCombo2 && m_PreviousCurrentStateInfo.shortNameHash != m_HashEllenCombo2 ||
            m_CurrentStateInfo.shortNameHash == m_HashEllenCombo3 && m_PreviousCurrentStateInfo.shortNameHash != m_HashEllenCombo3)    
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
            m_IdleTimer += Time.deltaTime;

            if (m_IdleTimer >= idleTempoDeOciosidade)
            {
                m_IdleTimer = 0f;
                animator.SetTrigger(m_HashTimeoutToIdle);
            }
        }
        else
        {
            m_IdleTimer = 0f;
            animator.ResetTrigger(m_HashTimeoutToIdle);
        }

        animator.SetBool(m_HashInputDetected, inputDetected);
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
            Ray ray = new Ray(transform.position + Vector3.up * k_GroundedRayDistance * 0.5f, -Vector3.up);
            if (Physics.Raycast(ray, out hit, k_GroundedRayDistance, Physics.AllLayers, QueryTriggerInteraction.Ignore))
            {
                // ... and get the movement of the root motion rotated to lie along the plane of the ground.
                movement = Vector3.ProjectOnPlane(animator.deltaPosition, hit.normal);

                // Also store the current walking surface so the correct audio is played.
                Renderer groundRenderer = hit.collider.GetComponentInChildren<Renderer>();
                superficeAtual = groundRenderer ? groundRenderer.sharedMaterial : null;
            }
            else
            {
                // If no ground is hit just get the movement as the root motion.
                // Theoretically this should rarely happen as when grounded the ray should always hit.
                movement = animator.deltaPosition;
                superficeAtual = null;
            }
        }
        else
        {
            // If not grounded the movement is just in the forward direction.
            movement = velocidadeFoward * transform.forward * Time.deltaTime;
        }

        // Rotate the transform of the character controller by the animation's root rotation.
        charCtrl.transform.rotation *= animator.deltaRotation;

        // Add to the movement with the calculated vertical speed.
        movement += velocidadeVertical * Vector3.up * Time.deltaTime;

        // Move the character controller.
        charCtrl.Move(movement);

        // After the movement store whether or not the character controller is grounded.
        noChao = charCtrl.isGrounded;

        // If Ellen is not on the ground then send the vertical speed to the animator.
        // This is so the vertical speed is kept when landing so the correct landing animation is played.
        if (!noChao)
            animator.SetFloat(m_HashAirborneVerticalSpeed, velocidadeVertical);

        // Send whether or not Ellen is on the ground to the animator.
        animator.SetBool(m_HashGrounded, noChao);
    }

    // This is called by an animation event when Ellen swings her staff.
    public void MeleeAttackStart(int throwing = 0)
    {
        garrasMelee.BeginAttack(throwing != 0);
        m_InAttack = true;
    }

    // This is called by an animation event when Ellen finishes swinging her staff.
    public void MeleeAttackEnd()
    {
        garrasMelee.EndAttack();
        m_InAttack = false;
    }

    // This is called by Checkpoints to make sure Ellen respawns correctly.
    public void SetCheckpoint(Checkpoint checkpoint)
    {
        if (checkpoint != null)
            m_CurrentCheckpoint = checkpoint;
    }

    // This is usually called by a state machine behaviour on the animator controller but can be called from anywhere.
    public void Respawn()
    {
        StartCoroutine(RespawnRoutine());
    }

    protected IEnumerator RespawnRoutine()
    {
        // Wait for the animator to be transitioning from the EllenDeath state.
        while (m_CurrentStateInfo.shortNameHash != m_HashEllenDeath || !m_IsAnimatorTransitioning)
        {
            yield return null;
        }

        // Wait for the screen to fade out.
        yield return StartCoroutine(ScreenFader.FadeSceneOut());
        while (ScreenFader.IsFading)
        {
            yield return null;
        }

        // Enable spawning.
        KatzenSpawn spawn = GetComponentInChildren<KatzenSpawn>();
        spawn.enabled = true;

        // If there is a checkpoint, move Ellen to it.
        if (m_CurrentCheckpoint != null)
        {
            transform.position = m_CurrentCheckpoint.transform.position;
            transform.rotation = m_CurrentCheckpoint.transform.rotation;
        }
        else
        {
            Debug.LogError("There is no Checkpoint set, there should always be a checkpoint set. Did you add a checkpoint at the spawn?");
        }

        // Get Ellen's health back.
        m_Damageable.ResetDamage();

        // Set the Respawn parameter of the animator.
        animator.SetTrigger(m_HashRespawn);

        // Start the respawn graphic effects.
        spawn.StartEffect();

        // Wait for the screen to fade in.
        // Currently it is not important to yield here but should some changes occur that require waiting until a respawn has finished this will be required.
        yield return StartCoroutine(ScreenFader.FadeSceneIn());
    }

    // Called by a state machine behaviour on Ellen's animator controller.
    public void RespawnFinished()
    {
        m_Respawning = false;
        m_Damageable.isInvulnerable = false;
    }

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
        animator.SetTrigger(m_HashHurt);

        // Find the direction of the damage.
        Vector3 forward = damageMessage.damageSource - transform.position;
        forward.y = 0f;

        Vector3 localHurt = transform.InverseTransformDirection(forward);

        // Set the HurtFromX and HurtFromY parameters of the animator based on the direction of the damage.
        animator.SetFloat(m_HashHurtFromX, localHurt.x);
        animator.SetFloat(m_HashHurtFromY, localHurt.z);

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
        animator.SetTrigger(m_HashDeath);
        velocidadeFoward = 0f;
        velocidadeVertical = 0f;
        m_Respawning = true;
        m_Damageable.isInvulnerable = true;
    }
}