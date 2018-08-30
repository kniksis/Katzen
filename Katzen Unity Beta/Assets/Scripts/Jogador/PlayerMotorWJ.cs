using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMotorWJ : MonoBehaviour {

	private Vector3 moveVector;
	private Vector3 lastMove;
	private float speed = 3;
	private float jumpforce = 8;
	private float gravity = 25;
	private float verticalVelocity;
	private CharacterController controller;

	// Use this for initialization
	void Start () {
		controller = GetComponent<CharacterController>();
	}
	
	// Update is called once per frame
	void Update () {
		moveVector = Vector3.zero;
		//moveVector.x = Input.GetAxis("Horizontal");
		//moveVector.z = Input.GetAxis("Vertical");

		if(controller.isGrounded)
		{
			verticalVelocity = -1;

			if(Input.GetButtonDown("Jump"))
			{
				verticalVelocity = jumpforce;
			}
		}

		else
		{
			verticalVelocity -= gravity * Time.deltaTime;
			moveVector = lastMove;
		}
		
		moveVector.y = 0;
		moveVector.Normalize();
		moveVector *= speed;
		moveVector.y = verticalVelocity;

		controller.Move(moveVector * Time.deltaTime);
		lastMove = moveVector;
	}

	private void OnControllerColliderHit(ControllerColliderHit hit)
	{
		if(!controller.isGrounded && hit.normal.y < 0.1f)
		{
			if(Input.GetButtonDown("Jump"))
			{
				Debug.DrawRay(hit.point, hit.normal, Color.red, 1.25f);
				verticalVelocity = jumpforce;
				moveVector = hit.normal * speed;
			}
		}
	}
}