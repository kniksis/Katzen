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
		Vector3 localvelocity = transform.InverseTransformDirection(charctrl.velocity);
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
	}

	// Update is called once per frame
	void Update()
	{

	}
}
