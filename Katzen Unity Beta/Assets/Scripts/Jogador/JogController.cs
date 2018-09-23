using System;
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
    public float StepOffset;
    public float minStepOffset;

    Vector3 input;
    Vector3 move;
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

    void Start()
    {
        cam = Camera.main.transform;
    }

    // Update is called once per frame
    void Update()
    {

        PlayerInput();

        if (Mathf.Abs(input.x) < 1 && Mathf.Abs(input.y) < 1)
        {
            return;
        }
        
        CalculateDirection();
        Rotate();
        Move();
    }

    private void FixedUpdate()
    {
        
    }

    private void PlayerInput()
    {
        jumpInput = Input.GetButtonDown(JUMP_BT_NAME);
        input.x = Input.GetAxisRaw(HORIZONTAL_BT_NAME);
        input.y = CrossPlatformInputManager.GetAxisRaw(VERTICAL_BT_NAME);
        horizontalInput = CrossPlatformInputManager.GetAxis(HORIZONTAL_BT_NAME);
        verticalInput = CrossPlatformInputManager.GetAxis(VERTICAL_BT_NAME);
    }

    void CalculateDirection()
    {
        //Relativa a rotação da camera
        //angle = Mathf.Atan2(input.x, input.y);
        angle = Mathf.Atan2(input.x, input.y);
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
        transform.position += transform.forward * fowardVelocity * Time.deltaTime;
    }

        void MoverXY()
    {
        rb.AddForce(transform.forward * fowardVelocity * verticalInput / Time.deltaTime);
        rb.AddForce(transform.right * fowardVelocity * horizontalInput / Time.deltaTime);
    }

    private void OnCollisionStay(Collision collision)
    {
        for (int i = 0; i < collision.contacts.Length; i++)
        {
            float localOffset = collision.contacts[i].point.y - transform.position.y;

            if (Math.Abs(localOffset) <= StepOffset && localOffset > minStepOffset)
            {
                //transform.position = new Vector3(transform.position.x, collision.contacts[i].point.y + 0.05f, transform.position.z);
                Vector3 endPos = new Vector3(transform.position.x, collision.contacts[i].point.y + 0.05f, transform.position.z);
                transform.position = Vector3.Lerp(transform.position, endPos, 1000.9f);
            }
        }
    }
}