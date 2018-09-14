using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JogMovimentar : MonoBehaviour {

	public Animator anim;
	CharacterController charctrl;
	
	public float fowardVelocity;
    float turnangle;
    public float jumpforce = 8;
    public float gravity = 25;
    public float verticalVelocity;

    bool attackKey;
    bool combatAimKey;
    float AttackChargeTimer = 0;
    float comboChargeTime = 0;
    public float comboChargeVelocity;
    bool runKey;
    public string FORWARD_AXIS = "Vertical";
    public string TURN_AXIS = "Horizontal";
    public string JUMP_AXIS = "Jump";

    Vector3 velocity = Vector3.zero;
    Vector3 playermovement;
    Vector3 moveVector;
    Vector3 lastMove;

    float forwardInput, turnInput, jumpInput;

    public GameObject HandPosition;

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
    void Start()
	{
		charctrl = GetComponent<CharacterController>();
		anim = GetComponent<Animator>();
    }

	void PlayerInput()
	{
		turnangle = Input.GetAxis(TURN_AXIS);
        playermovement.z = Input.GetAxis(FORWARD_AXIS) * fowardVelocity;
        runKey = Input.GetButton("Run");
        attackKey = Input.GetButton("Fire1");
        combatAimKey = Input.GetButton("Fire2");
        jumpInput = Input.GetAxisRaw(JUMP_AXIS);
        moveVector = Vector3.zero;
        moveVector.x = Input.GetAxis("Horizontal");
        moveVector.z = Input.GetAxis("Vertical");
    }

	void PlayerControl()
	{
        if (charctrl.isGrounded)
        {
            transform.Rotate(Vector3.up * turnangle);
            Vector3 globalmov = transform.TransformDirection(playermovement);
            charctrl.SimpleMove(globalmov);
        }
	}

    void PuloControl()
    {
        if (charctrl.isGrounded)
        {
            if (jumpInput > 0)
            {
                verticalVelocity = jumpforce;
                anim.Play("PuloImpulso");
            }
        }

        else
        {
            verticalVelocity -= gravity * Time.deltaTime;
            moveVector = lastMove;
        }

        moveVector.y = 0;
        moveVector.Normalize();
        moveVector *= fowardVelocity;
        moveVector.y = verticalVelocity;

        if(!charctrl.isGrounded)
        {
            charctrl.Move(moveVector * Time.deltaTime);
            lastMove = moveVector;
        }
    }

    void AnimatorControl()
	{
		localvelocity = transform.InverseTransformDirection(charctrl.velocity);
		anim.SetFloat("velocity", localvelocity.z);
		anim.SetFloat("turn", turnangle);
	}

	void CombatControl()
	{
        if (combatAimKey && comboChargeTime < 1)
        {
            comboChargeTime += Time.deltaTime * comboChargeVelocity;
        }

        if (!combatAimKey && comboChargeTime > 0)
        {
            comboChargeTime -= Time.deltaTime * comboChargeVelocity;
        }

        anim.SetLayerWeight(1, comboChargeTime);

        if (attackKey)
		{
            //anim.Play("Soco");
            anim.SetBool("Attack", true);
        }
		else
		{
			anim.SetBool("Attack", false);
		}

        if (attackKey)
        {
            AttackChargeTimer += Time.deltaTime;
        }

        if (!attackKey && (AttackChargeTimer > 0.4f))
        {
            anim.SetBool("HoldAttack", true);
        }
        if(!attackKey && (AttackChargeTimer >= 0.0f))
        {
            AttackChargeTimer -= Time.deltaTime;
        }
        if(AttackChargeTimer < 0.1f)
        {
            anim.SetBool("HoldAttack", false);
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

    void RunControl()
	{
		if (runKey)
		{
			fowardVelocity = 4.0f;
		}
		else
		{
			fowardVelocity = 1.0f;
		}
	}


	private void FixedUpdate()
	{
		PlayerInput();
        PuloControl();
        PlayerControl();
        AnimatorControl();
		CombatControl();
		RunControl();
        FootPlacementR();
        FootPlacementL();

    }

	// Update is called once per frame
	void Update()
	{

	}
    
    private void OnControllerColliderHit(ControllerColliderHit hit)
    {
        if (!charctrl.isGrounded && hit.normal.y < 0.1f)
        {
            if (Input.GetButtonDown(JUMP_AXIS))
            {
                Debug.DrawRay(hit.point, hit.normal, Color.red, 2.0f);
                verticalVelocity = jumpforce;
                moveVector = hit.normal * fowardVelocity;
                anim.Play("ParedePulo");
            }
        }
    }
}
