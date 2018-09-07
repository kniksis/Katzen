using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JogMovimentar : MonoBehaviour {

	public Animator anim;
	CharacterController charctrl;
	float turnangle;
	public float runvelocity;
	bool attackKey;
	bool kickKey;
	bool runKey;
	Vector3 playermovement;

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

    // Use this for initialization
    void Start()
	{
		charctrl = GetComponent<CharacterController>();
		anim = GetComponent<Animator>();
	}

	void PlayerInput()
	{
		turnangle = Input.GetAxis("Horizontal");
		playermovement = new Vector3(0, 0, Input.GetAxis("Vertical") * runvelocity);
		attackKey = Input.GetButton("Fire1");
		kickKey = Input.GetButton("Fire2");
		runKey = Input.GetButton("Run");
	}

	void PlayerControl()
	{
		transform.Rotate(Vector3.up * turnangle);
		Vector3 globalmov = transform.TransformDirection(playermovement);
		charctrl.SimpleMove(globalmov);
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

		if (kickKey)
		{
			anim.SetBool("Kick", true);
		}
		else
		{
			anim.SetBool("Kick", false);
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
        anim.SetIKRotation(AvatarIKGoal.RightFoot, Quaternion.LookRotation(footRrotation)*Quaternion.EulerAngles(0, footRanimator.transform.rotation.eulerAngles.z + footRanimator.transform.rotation.eulerAngles.x, 0));

        anim.SetIKPositionWeight(AvatarIKGoal.LeftFoot, footLweight);
        anim.SetIKPosition(AvatarIKGoal.LeftFoot, footLposition);
    }

    void FootPlacementR()
    {
        if (Mathf.Abs(localvelocity.z) < 0.5f && Mathf.Abs(turnangle) < 0.5f)
        {
            Vector3 raylocationR = footRanimator.transform.position + Vector3.up;
            RaycastHit hit;
            Debug.DrawRay(raylocationR, Vector3.down);

            if (Physics.Raycast(raylocationR, Vector3.down, out hit))
            {
                footRweight = Mathf.Lerp(footRweight, 1, Time.fixedDeltaTime * 10);
                footRposition = new Vector3(footRanimator.transform.position.x, hit.point.y + 0.05f, footRanimator.transform.position.z);
                
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
        if (Mathf.Abs(localvelocity.z) < 0.5f && Mathf.Abs(turnangle) < 0.5f)
        {
            Vector3 raylocationL = footLanimator.transform.position + Vector3.up;
            RaycastHit hit;
            Debug.DrawRay(raylocationL, Vector3.down);

            if (Physics.Raycast(raylocationL, Vector3.down, out hit))
            {
                footLweight = Mathf.Lerp(footLweight, 1, Time.fixedDeltaTime * 10);
                footLposition = new Vector3(footLanimator.transform.position.x, hit.point.y + 0.05f, footLanimator.transform.position.z);
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
			runvelocity = 4.0f;
		}
		else
		{
			runvelocity = 1.0f;
		}
	}

	private void FixedUpdate()
	{
		PlayerInput();
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
}
