using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.CrossPlatformInput;

public class JogMovimentoRigid : MonoBehaviour
{
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

    [Header("Componentes")]
    public Animator animJog;
    public Animator animHUDArmas;
    public Rigidbody rb;
    public Collider myColl;
    bool isGrounded;
    public Transform cameraOrb;
    private Vector3 cameraOrbForward;
    Quaternion targetRotation;
    [SerializeField]
    GameObject cameraGO;
    [SerializeField]
    CameraOrbital camScript;

    [Header("Movimentos")]
    float angle;
    Vector3 move;
    float wallDistance = 0;
    public Transform peitoInicio;
    public bool Jump;
    private int numJumps = 0;
    private int maxJumps = 2;
    public bool controlJumpDirection;
    public bool walk;
    public bool equilibrar;

    [Header("StepOffset")]
    public float StepOffset;
    public float minStepOffset;
    public float WallOffset;

    public float fowardVelocity;
    [Range(0f, 1f)] [SerializeField] float WalkVelocity;
    [Range(0f, 2f)] [SerializeField] float RunVelocity;
    [Range(0f, 1f)] [SerializeField] float NormalVelocity;
    public float turnangle;
    public float turnSpeed;
    public float jumpforce;

    public float MoveSpeedMulti = 1.0f;
    Vector3 m_GroundNormal;
    float m_OrigGroundCheckDistance;
    float m_AnimSpeedMultiplier = 1;

    [Header("IK's")]
    bool jumpInput;
    bool MirarInput;
    float horizontalInput;
    float verticalInput;
    float TrocaArmaInput;
    float AtirarInput;
    public string JUMP_BT_NAME;
    public string HORIZONTAL_BT_NAME;
    public string VERTICAL_BT_NAME;
    public string TROCA_ARMA_BT_NAME;
    public string MIRAR_BT_NAME;
    public string ATIRAR_BT_NAME;

    [SerializeField] float m_GroundCheckDistance = 0.1f;

    [Header("IK's")]
    public GameObject footRanimator;
    public GameObject footLanimator;
    float footRweight = 0;
    float footLweight = 0;
    Vector3 footRposition;
    Vector3 footLposition;
    Vector3 footRrotation;
    Vector3 footLrotation;
    Vector3 localvelocity;
    public float ikVeloMin;
    public float ikYOffset;

    // Use this for initialization
    void Awake()
    {
        rb = GetComponent<Rigidbody>();
        animJog = GetComponent<Animator>();
        myColl = GetComponent<CapsuleCollider>();
        rb.constraints = RigidbodyConstraints.FreezeRotationX | RigidbodyConstraints.FreezeRotationY | RigidbodyConstraints.FreezeRotationZ;
        m_OrigGroundCheckDistance = m_GroundCheckDistance;
        if (Camera.main != null)
        {
            cameraOrb = Camera.main.transform;
        }
        Jump = false;

        cameraGO = GameObject.Find("Main Camera");
        camScript = cameraGO.GetComponent<CameraOrbital>();
    }

    // Update is called once per frame
    void Update()
    {
        PlayerControl();

        PlayerInput();

        switch (action)
        {
            case Mode.AndarNormal:
                AnimatorControlWalkNornal(Vector3.zero);
                MoverNormalControle();
                break;
            case Mode.AndarMirando:
                AnimatorControlWalk8Way();
                break;
        }
        TrocarArmas();

        CheckGroundStatus();
        
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
        FootPlacementR();
        FootPlacementL();

        switch (action)
        {
            case Mode.AndarNormal:
                //if (Mathf.Abs(verticalInput) < 1 && Mathf.Abs(horizontalInput) < 1)//Faz giro por mouse não influenciar o giro do personagem quando ele estiver parado, precisa ser desativado caso o input seja por controle Xbox
                //{
                //    //return;
                //}

                if (verticalInput != 0 || horizontalInput != 0)
                {
                    CalculateDirection();
                    Rotate();
                }
                PuloParede();
                JumpFixed();
                MoveInJumpCharacter();
                break;
            case Mode.AndarMirando:
                AnimatorControlWalk8Way();
                MoverMirando();
                CalculateDirectionMira();
                Rotate();
                break;
            case Mode.Escorregar:
                EscorregarControle();
                break;
        }
    }

    private void PlayerInput()
    {
        jumpInput = Input.GetButtonDown(JUMP_BT_NAME);
        horizontalInput = Input.GetAxisRaw(HORIZONTAL_BT_NAME);
        verticalInput = Input.GetAxisRaw(VERTICAL_BT_NAME);
        TrocaArmaInput = Input.GetAxis(TROCA_ARMA_BT_NAME);
        AtirarInput = Input.GetAxis(ATIRAR_BT_NAME);
        MirarInput = Input.GetButton(MIRAR_BT_NAME);
    }


    private void TrocarArmas()
    {
        animHUDArmas.SetFloat("ForcaEstilingue", AtirarInput);
        if (TrocaArmaInput > 0 && combate == Combat.Garras)
        {
            animJog.SetLayerWeight(3, 1.0f);
            animHUDArmas.SetBool("Armado", true);
            animJog.SetBool("Armado", true);
            animJog.CrossFade("PickGun", Time.deltaTime);
            combate = Combat.Estilingue;
        }

        if (TrocaArmaInput < 0 && combate == Combat.Estilingue)
        {
            animJog.SetLayerWeight(3, 1.0f);
            animHUDArmas.SetBool("Armado", false);
            animJog.SetBool("Armado", false);
            animJog.CrossFade("PutGun", Time.deltaTime);
            combate = Combat.Garras;
        }
    }

    public void Mirar()
    {
        if (MirarInput)
        {
            animJog.SetLayerWeight(3, 1.0f);
            animJog.SetLayerWeight(4, 1.0f);
            animJog.SetBool("Mirar", true);
            action = Mode.AndarMirando;
        }

        if (!MirarInput)
        {
            //animJog.SetLayerWeight(3, 0.0f);
            animJog.SetLayerWeight(4, 0.0f);
            animJog.SetBool("Mirar", false);
            action = Mode.AndarNormal;
        }
    }

    public void zeraPesoLayerAim()
    {
        animJog.SetLayerWeight(3, 0.0f);
    }

    private void PlayerControl()
    {
        if (jumpInput)
        {
            Jump = true;
        }
    }

    private void MoverMirando()
    {
        animJog.SetFloat("MoveX", horizontalInput);
        animJog.SetFloat("MoveZ", verticalInput);
    }

    void EscorregarControle()
    {
        rb.AddForce(transform.forward * 3, ForceMode.Force);
        animJog.Play("SlideFall");
    }


    public void MoverNormalControle()
    {
        if (cameraOrb != null)
        {
            cameraOrbForward = Vector3.Scale(cameraOrb.forward, new Vector3(1, 0, 1)).normalized;
            move = verticalInput * cameraOrbForward + horizontalInput * cameraOrb.right;
        }

        else
        {
            move = verticalInput * Vector3.forward + horizontalInput * Vector3.right;
        }

        move *= NormalVelocity;

        if (Input.GetButton("Walk"))
        {
            move *= WalkVelocity;
        }

        if (Input.GetButton("Run"))
        {
            move *= RunVelocity;
        }


        MoverNormal(move);
    }

    public void MoverNormal(Vector3 move)
    {
        if (move.magnitude > 1.0f)
        {
            move.Normalize();
        }

        move = transform.InverseTransformDirection(move);
        CheckGroundStatus();
        move = Vector3.ProjectOnPlane(move, m_GroundNormal);
        //turnangle = Mathf.Atan2(move.x, move.z);
        fowardVelocity = move.z;
        AnimatorControlWalkNornal(move);
    }

    void CalculateDirection()
    {
        //Relativa a rotação da camera
        //angle = Mathf.Atan2(move.x, move.z);
        angle = Mathf.Atan2(horizontalInput, verticalInput);
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
        targetRotation = Quaternion.Euler(0, angle, 0);//converte para quaternion
        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, turnSpeed * Time.deltaTime);
    }

    private void JumpFixed()
    {
        if (Jump)
        {
            JumpCharacter();
        }
    }

    void JumpCharacter()
    {
        if (isGrounded)
        {
            numJumps = 0;
            controlJumpDirection = false;
        }
        if (isGrounded || numJumps < maxJumps)
        {
            if (!isGrounded)
            {
                animJog.Play("PuloDuplo");
                controlJumpDirection = true;
            }
            else
            {
                controlJumpDirection = true;
                animJog.Play("PuloSubindo");
            }
            rb.AddForce(Vector3.up * jumpforce, ForceMode.Impulse);
            numJumps += 1;
        }
        Jump = false;
    }

    void MoveInJumpCharacter()
    {
        if (controlJumpDirection)
        {
            rb.AddForce(transform.forward * verticalInput * jumpforce, ForceMode.Force);
            rb.AddForce(transform.right * horizontalInput * jumpforce, ForceMode.Force);
        }
    }

    private void PuloParede()
    {
        RaycastHit hit;

        if (Physics.Raycast(peitoInicio.transform.position, peitoInicio.transform.forward * WallOffset, out hit, WallOffset))
        {
            Debug.DrawRay(peitoInicio.transform.position, peitoInicio.transform.forward * WallOffset, Color.blue);
            if (!isGrounded)
            {

                if (Jump)
                {
                    rb.AddForce(transform.up * jumpforce * 2, ForceMode.Impulse);
                    rb.AddForce(-transform.forward * jumpforce / 1.3f, ForceMode.Impulse);
                    animJog.Play("ParedePulo");
                }

                else
                {
                    rb.AddForce(transform.forward * 10, ForceMode.Acceleration);
                    animJog.Play("ParedeLoop");
                }
            }
        }

        else
        {
            Debug.DrawRay(peitoInicio.transform.position, peitoInicio.transform.forward * WallOffset, Color.white);
        }
    }

    void AnimatorControlWalkNornal(Vector3 move)
    {
        float angleangle = angle;
        animJog.SetFloat("velocity", fowardVelocity, 0.1f, Time.deltaTime);
        animJog.SetFloat("turn", turnangle, 0.1f, Time.deltaTime);

        if (isGrounded && move.magnitude > 0)
        {
            animJog.speed = m_AnimSpeedMultiplier;
        }

        else
        {
            // don't use that while airborne
            animJog.speed = 1;
        }
    }

    void AnimatorControlWalk8Way()
    {
            localvelocity = transform.InverseTransformDirection(rb.velocity);
            animJog.SetFloat("velocity", localvelocity.z, 0.1f, Time.deltaTime);
        animJog.SetFloat("MiraX", camScript.y);
    }

    public void OnAnimatorMove()
    {
        if(isGrounded && Time.deltaTime > 0)
        {
            Vector3 v = (animJog.deltaPosition * MoveSpeedMulti) / Time.deltaTime;
            v.y = rb.velocity.y;
            rb.velocity = v;
        }
    }

    private void OnAnimatorIK(int layerIndex)
    {
        animJog.SetIKPositionWeight(AvatarIKGoal.RightFoot, footRweight);
        animJog.SetIKPosition(AvatarIKGoal.RightFoot, footRposition);
        animJog.SetIKRotationWeight(AvatarIKGoal.RightFoot, footRweight);
        //anim.SetIKRotation(AvatarIKGoal.RightFoot, Quaternion.LookRotation(footRrotation) * Quaternion.EulerAngles(0, footRanimator.transform.rotation.eulerAngles.z + footRanimator.transform.rotation.eulerAngles.x, 0));
        animJog.SetIKRotation(AvatarIKGoal.RightFoot, Quaternion.LookRotation(footRrotation) * Quaternion.Euler(0, footRanimator.transform.right.y, 0));

        animJog.SetIKPositionWeight(AvatarIKGoal.LeftFoot, footLweight);
        animJog.SetIKPosition(AvatarIKGoal.LeftFoot, footLposition);
        animJog.SetIKRotationWeight(AvatarIKGoal.LeftFoot, footLweight);
        animJog.SetIKRotation(AvatarIKGoal.LeftFoot, Quaternion.LookRotation(footLrotation) * Quaternion.Euler(0, footLanimator.transform.right.y, 0));
    }

    void FootPlacementR()
    {
        if (Mathf.Abs(fowardVelocity) < ikVeloMin && Mathf.Abs(horizontalInput) < ikVeloMin && isGrounded)
        {
            Vector3 raylocationR = footRanimator.transform.position + Vector3.up;
            RaycastHit hit;
            Debug.DrawRay(raylocationR, Vector3.down);

            if (Physics.Raycast(raylocationR, Vector3.down, out hit))
            {
                footRweight = Mathf.Lerp(footRweight, 1, Time.fixedDeltaTime * 10);
                footRposition = new Vector3(footRanimator.transform.position.x, hit.point.y + ikYOffset, footRanimator.transform.position.z);

                footRrotation = Vector3.Cross(transform.right, hit.normal);
            }
        }

        else
        {
            footRweight = Mathf.Lerp(footRweight, 0, Time.fixedDeltaTime * 50);
        }
    }

    void FootPlacementL()
    {
        if (Mathf.Abs(fowardVelocity) < ikVeloMin && Mathf.Abs(horizontalInput) < ikVeloMin && isGrounded)
        {
            Vector3 raylocationL = footLanimator.transform.position + Vector3.up;
            RaycastHit hit;
            Debug.DrawRay(raylocationL, Vector3.down);

            if (Physics.Raycast(raylocationL, Vector3.down, out hit))
            {
                footLweight = Mathf.Lerp(footLweight, 1, Time.fixedDeltaTime * 10);
                footLposition = new Vector3(footLanimator.transform.position.x, hit.point.y + ikYOffset, footLanimator.transform.position.z);

                footLrotation = Vector3.Cross(transform.right, hit.normal);
            }
        }

        else
        {
            footLweight = Mathf.Lerp(footLweight, 0, Time.fixedDeltaTime * 50);
        }
    }

    void CheckGroundStatus()
    {
        RaycastHit hitInfo;
        Debug.DrawLine(transform.position + (Vector3.up * 0.1f), transform.position + (Vector3.up * 0.1f) + (Vector3.down * m_GroundCheckDistance));

        if (Physics.Raycast(transform.position + (Vector3.up * 0.1f), Vector3.down, out hitInfo, m_GroundCheckDistance))
        {
            m_GroundNormal = hitInfo.normal;
            isGrounded = true;
            animJog.applyRootMotion = true;
        }
        else
        {
            isGrounded = false;
            m_GroundNormal = Vector3.up;
            animJog.applyRootMotion = false;
        }
    }

    private void OnCollisionStay(Collision collision)
    {
        for (int i = 0; i < collision.contacts.Length; i++)
        {
            //if (Math.Abs(collision.contacts[i].point.y - StepOffset) <= StepOffset)
            //{
            //    transform.position = new Vector3(transform.position.x, collision.contacts[i].point.y, transform.position.z);
            //    //Vector3 endPos = new Vector3(transform.position.x, collision.contacts[i].point.y, transform.position.z);
            //    //transform.position = Vector3.Lerp(transform.position, endPos, 1000.9f);
            //}
            float localOffset = collision.contacts[i].point.y - transform.position.y;
            
            if (Math.Abs(localOffset) <= StepOffset && localOffset > minStepOffset)
            {
                //transform.position = new Vector3(transform.position.x, collision.contacts[i].point.y + 0.05f, transform.position.z);
                Vector3 endPos = new Vector3(transform.position.x, collision.contacts[i].point.y + 0.05f, transform.position.z);
                transform.position = Vector3.Lerp(transform.position, endPos, 1000.9f);
            }
        }
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Grab")
        {
            animJog.SetBool("Equilibrar", true);
            animJog.SetFloat("velocity", localvelocity.z, 0.1f, Time.deltaTime);
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if (other.tag == "Grab")
        {
            animJog.SetBool("Equilibrar", false);
        }
    }
}
