using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.CrossPlatformInput;

public class JogMovimentoRigid : MonoBehaviour
{

    public Animator anim;
    public Rigidbody rb;
    bool isGrounded;
    public Transform cameraOrb;
    private Vector3 cameraOrbForward;
    Vector3 move;
    float wallDistance = 0;
    public Transform peitoInicio;
    public Transform peitoFim;
    public float StepOffset;

    public float fowardVelocity;
    public float turnangle;
    public float jumpforce;
    Vector3 m_GroundNormal;
    float m_OrigGroundCheckDistance;
    float m_AnimSpeedMultiplier = 1;

    bool jumpInput;
    float horizontalInput;
    float verticalInput;
    public string JUMP_BT_NAME;
    public string HORIZONTAL_BT_NAME;
    public string VERTICAL_BT_NAME;

    [SerializeField] float m_GroundCheckDistance = 0.1f;
    

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
    void Start () {
        rb = GetComponent<Rigidbody>();
        anim = GetComponent<Animator>();
        rb.constraints = RigidbodyConstraints.FreezeRotationX | RigidbodyConstraints.FreezeRotationY | RigidbodyConstraints.FreezeRotationZ;
        m_OrigGroundCheckDistance = m_GroundCheckDistance;
        if(Camera.main != null)
        {
            cameraOrb = Camera.main.transform;
        }
    }
	
	// Update is called once per frame
	void Update () {

        PuloParede();
    }

    private void FixedUpdate()
    {
        PlayerInput();
        if (isGrounded)
        {
            //Mover();
            Pular();
        }
        AnimatorControl(Vector3.zero);
        FootPlacementR();
        FootPlacementL();
        CheckGroundStatus();
        MoverControle();
        PuloParede();
    }

    private void PlayerInput()
    {
        jumpInput = Input.GetButtonDown(JUMP_BT_NAME);
    }

    private void Mover()
    {
        if(move.magnitude > 1.0f)
        {
            move.Normalize();
        }
        move = transform.InverseTransformDirection(move);
        move = Vector3.ProjectOnPlane(move, m_GroundNormal);
        turnangle = Mathf.Atan2(move.x, move.z);
        fowardVelocity = move.z;

        AnimatorControl(move);
    }

    private void MoverControle()
    {
        horizontalInput = CrossPlatformInputManager.GetAxis(HORIZONTAL_BT_NAME);
        verticalInput = CrossPlatformInputManager.GetAxis(VERTICAL_BT_NAME);

        if(cameraOrb != null)
        {
            cameraOrbForward = Vector3.Scale(cameraOrb.forward, new Vector3(1, 0, 1)).normalized;
            move = verticalInput * cameraOrbForward + horizontalInput * cameraOrb.right;
        }

        else
        {
            move = verticalInput * Vector3.forward + horizontalInput * Vector3.right;
        }

        Mover();
    }

    private void Pular()
    {
        if(jumpInput)
        {
            rb.AddForce(Vector3.up * jumpforce, ForceMode.Impulse);
        }
    }

    private void PuloParede()
    {
        //RaycastHit hit = Physics.Linecast(peito.transform.position, -Vector3.up);
        //wallDistance = Mathf.Abs(hit.point.y - transform.position.y);

        //RaycastHit hitf = Physics.Raycast(transform.position - Vector3.up * 0.15f, transform.forward);
        //Debug.DrawRay(transform.position - Vector3.up * 0.15f, transform.forward);

        //peito = transform.TransformDirection(0.0f, 1.0f, 1.0f);

            Debug.DrawRay(peitoInicio.transform.position, peitoInicio.transform.forward*0.5f, Color.blue);
        //if (Physics.Raycast(peitoInicio.transform.position, Vector3.forward*0.5f, wallDistance))
        //{
        //    Debug.Log("Olha ai o, panaca, bateu!");
        //}
    }

    void AnimatorControl(Vector3 move)
    {
        anim.SetFloat("velocity", fowardVelocity, 0.1f, Time.deltaTime);
        anim.SetFloat("turn", turnangle, 0.1f, Time.deltaTime);

        if(isGrounded && move.magnitude > 0)
        {
            anim.speed = m_AnimSpeedMultiplier;
        }

        else
        {
            // don't use that while airborne
            anim.speed = 1;
        }
    }

    private void OnAnimatorIK(int layerIndex)
    {
        /*anim.SetIKPositionWeight(AvatarIKGoal.LeftHand, 1);
        anim.SetIKPosition(AvatarIKGoal.LeftHand, HandPosition.transform.position);
        anim.SetIKRotationWeight(AvatarIKGoal.LeftHand, 1);
        anim.SetIKRotation(AvatarIKGoal.LeftHand, HandPosition.transform.rotation);*/

        anim.SetIKPositionWeight(AvatarIKGoal.RightFoot, footRweight);
        anim.SetIKPosition(AvatarIKGoal.RightFoot, footRposition);
        anim.SetIKRotationWeight(AvatarIKGoal.RightFoot, footRweight);
        //anim.SetIKRotation(AvatarIKGoal.RightFoot, Quaternion.LookRotation(footRrotation) * Quaternion.EulerAngles(0, footRanimator.transform.rotation.eulerAngles.z + footRanimator.transform.rotation.eulerAngles.x, 0));
        anim.SetIKRotation(AvatarIKGoal.RightFoot, Quaternion.LookRotation(footRrotation) * Quaternion.Euler(0, footRanimator.transform.right.y, 0));

        anim.SetIKPositionWeight(AvatarIKGoal.LeftFoot, footLweight);
        anim.SetIKPosition(AvatarIKGoal.LeftFoot, footLposition);
        anim.SetIKRotationWeight(AvatarIKGoal.LeftFoot, footLweight);
        anim.SetIKRotation(AvatarIKGoal.LeftFoot, Quaternion.LookRotation(footLrotation) * Quaternion.Euler(0, footLanimator.transform.right.y, 0));
    }

    void FootPlacementR()
    {
        if (Mathf.Abs(localvelocity.z) < ikVeloMin && Mathf.Abs(turnangle) < ikVeloMin)
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
        if (Mathf.Abs(localvelocity.z) < ikVeloMin && Mathf.Abs(turnangle) < ikVeloMin)
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
#if UNITY_EDITOR
        // helper to visualise the ground check ray in the scene view
        Debug.DrawLine(transform.position + (Vector3.up * 0.1f), transform.position + (Vector3.up * 0.1f) + (Vector3.down * m_GroundCheckDistance));
#endif
        // 0.1f is a small offset to start the ray from inside the character
        // it is also good to note that the transform position in the sample assets is at the base of the character
        if (Physics.Raycast(transform.position + (Vector3.up * 0.1f), Vector3.down, out hitInfo, m_GroundCheckDistance))
        {
            m_GroundNormal = hitInfo.normal;
            isGrounded = true;
            anim.applyRootMotion = true;
        }
        else
        {
            isGrounded = false;
            m_GroundNormal = Vector3.up;
            anim.applyRootMotion = false;
        }
    }

    private void OnCollisionEnter(Collision collision)
    {
        Collider OtherCollider;
        Vector3 OtherSize;
        for (int i = 0; i < collision.contacts.Length; i++)
        {
            if(Math.Abs(collision.contacts[i].point.y - StepOffset) <= 0.001)
            {
                transform.position = new Vector3(transform.position.x, collision.contacts[i].point.y, transform.position.z);
            }
        }
    }
}
