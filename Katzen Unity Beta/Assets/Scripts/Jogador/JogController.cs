using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityStandardAssets.CrossPlatformInput;

public class JogController : MonoBehaviour
{
    public enum Mode
    {
        AndarNormal = 0,
        AndarMirando = 1
    }

    public Mode action = Mode.AndarNormal;

    public float fowardVelocity = 10;
    public float turnSpeed = 10;

    Vector3 input;
    bool jumpInput;
    float horizontalInput;
    float verticalInput;
    public string JUMP_BT_NAME;
    public string HORIZONTAL_BT_NAME;
    public string VERTICAL_BT_NAME;
    float angle;

    Quaternion targetRotation;
    Transform cam;
    Rigidbody rb;

    private void Awake()
    {
        rb = GetComponent<Rigidbody>();
        rb.constraints = RigidbodyConstraints.FreezeRotationX | RigidbodyConstraints.FreezeRotationY | RigidbodyConstraints.FreezeRotationZ;
    }

    void Start () {
        cam = Camera.main.transform;
	}
	
	// Update is called once per frame
	void Update () {
        GetInput();
        PlayerInput();
            Debug.Log(input.x);
        if (Mathf.Abs(input.x) < 1 && Mathf.Abs(input.y) < 1)
        {
            return;
        }

        //if (Mathf.Abs(horizontalInput) < 1 && Mathf.Abs(verticalInput) < 1)
        //{
        //    return;
        //}
        CalculateDirection();
        Rotate();
        Move();
    }

    private void PlayerInput()
    {
        jumpInput = Input.GetButtonDown(JUMP_BT_NAME);
        horizontalInput = CrossPlatformInputManager.GetAxis(HORIZONTAL_BT_NAME);
        verticalInput = CrossPlatformInputManager.GetAxis(VERTICAL_BT_NAME);
    }

    void GetInput()
    {
        switch (action)
        {
            case Mode.AndarNormal:
                input.x = Input.GetAxisRaw("Horizontal");
                input.y = Input.GetAxisRaw("Vertical");
                break;

            case Mode.AndarMirando:
                input.x = Input.GetAxisRaw("Horizontal");
                input.z = Input.GetAxisRaw("Vertical");
                break;
        }
    }

    void CalculateDirection()
    {
        //Relativa a rotação da camera
        //angle = Mathf.Atan2(input.x, input.y);
        angle = Mathf.Atan2(horizontalInput, verticalInput);
        angle = Mathf.Rad2Deg * angle;//converte para graus
        angle += cam.eulerAngles.y;
    }

    void Rotate()
    {
        targetRotation = Quaternion.Euler(0, angle, 0);//converte para quaternion
        transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, turnSpeed * Time.deltaTime);
    }

    void Move()
    {
        switch(action)
        {
            case Mode.AndarNormal:
                //transform.position += transform.forward * fowardVelocity * Time.deltaTime;
                rb.AddForce(transform.forward * fowardVelocity, ForceMode.Force);
            break;
            case Mode.AndarMirando:
                //transform.position += transform.forward * fowardVelocity * Time.deltaTime;
                rb.AddForce(transform.forward * fowardVelocity, ForceMode.Force);
            break;
        }
    }
}
