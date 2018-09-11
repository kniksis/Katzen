using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JogMovimentar : MonoBehaviour {

	public Animator anim;
	CharacterController charctrl;
	
	public float fowardVelocity;
    float turnangle;
    public float jumpVel = 25;
    public float distToGrounded = 0.1f;
    public LayerMask ground;
    public float downAccel = 0.75f;

    bool attackKey;
    public float AttackChargeTimer = 0;
	bool runKey;
    public string FORWARD_AXIS = "Vertical";
    public string TURN_AXIS = "Horizontal";
    public string JUMP_AXIS = "Jump";

    Vector3 velocity = Vector3.zero;
    Vector3 playermovement;

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

    bool Grounded()
    {
        return Physics.Raycast(transform.position, Vector3.down, distToGrounded, ground);
    }

    // Use this for initialization
    void Start()
	{
		charctrl = GetComponent<CharacterController>();
		anim = GetComponent<Animator>();
        charctrl = GetComponent<CharacterController>();
	}

	void PlayerInput()
	{
		turnangle = Input.GetAxis(TURN_AXIS);
        //playermovement = new Vector3(0, 0, Input.GetAxis(FORWARD_AXIS) * fowardVelocity);
        runKey = Input.GetButton("Run");
        attackKey = Input.GetButton("Fire1");
        jumpInput = Input.GetAxisRaw(JUMP_AXIS);
	}

	void PlayerControl()
	{
		transform.Rotate(Vector3.up * turnangle);
		Vector3 globalmov = transform.TransformDirection(playermovement);
		charctrl.SimpleMove(globalmov);
	}

    void PuloControl()
    {
        if (jumpInput > 0 && Grounded())
        {
            Debug.Log("pular");
            playermovement.y = jumpVel;
            Debug.Log("pulou");
        }

        if (jumpInput == 0 && Grounded())
        {
            playermovement.y = 0;
        }
        else
        {
            playermovement.y -= downAccel;
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
		if (attackKey)
		{
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

        if (!attackKey && (AttackChargeTimer > 0.5f))
        {
            anim.SetBool("HoldAttack", true);
            AttackChargeTimer = 0;
        }

        else
        {

            anim.SetBool("HoldAttack", false);
        }

        if (!attackKey && (AttackChargeTimer < 0.5f))
        {
            AttackChargeTimer = 0;
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

        playermovement.z = Input.GetAxis(FORWARD_AXIS) * fowardVelocity;
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
}
