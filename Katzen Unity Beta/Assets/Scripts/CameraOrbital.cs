using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraOrbital : MonoBehaviour {

	public GameObject[] alvo;
	public GameObject[] posicoes;
	private int indice = 0;

	public float distance = 5.0f;
	public float xSpeed = 120.0f;
	public float ySpeed = 120.0f;

	public float yMinLimit = -20f;
	public float yMaxLimit = 80f;
	
	public float distanceMin = .5f;
	public float distanceMax = 15f;

	float x = 0.0f;
	float y = 0.0f;

	private RaycastHit hit;

	private Rigidbody rigidbody;

	private Vector3 _cameraOffset;

	[Range(0.1f, 10.0f)]
	public float VelocidadeCamera = 5f;

	[Range(0, 20)]
	public int MultiCamVelo = 4;

	public bool LookAtPlayer = false;

	public bool RotacionarNoJogador = true;
	public float RotacionarVelocidade = 5.0f;

	void FixedUpdate(){

	}

	void Start()
	{
		Vector3 angles = transform.eulerAngles;
		x = angles.y;
		y = angles.x;

		rigidbody = GetComponent<Rigidbody>();

		if (rigidbody != null)
		{
			rigidbody.freezeRotation = true;
		}
		
	}

	void LateUpdate()
	{


		if (HasMouseMoved())
		{
			RotacionarNoJogador = true;
		}
		else
		{
			RotacionarNoJogador = false;
		}

		if (RotacionarNoJogador)
		{
			x += Input.GetAxis("Mouse X") * xSpeed * 0.02f;
			y -= Input.GetAxis("Mouse Y") * ySpeed * 0.02f;

		}
			y = ClampAngle(y, yMinLimit, yMaxLimit);

		Quaternion rotacao = Quaternion.Euler(y, x, 0);
		alvo[indice].transform.rotation = Quaternion.Lerp(rotacao, Quaternion.Euler(0.0f, 0.0f, 0.0f), VelocidadeCamera * Time.smoothDeltaTime);
		//distance = Mathf.Clamp(distance - Input.GetAxis("Mouse ScrollWheel") * 5, distanceMin, distanceMax);

		Vector3 camPosRotacao = posicoes[indice].transform.position;

		if (!Physics.Linecast(alvo[indice].transform.position, camPosRotacao))
		{
			transform.position = Vector3.Lerp(transform.position, camPosRotacao, VelocidadeCamera * Time.smoothDeltaTime);
		}
		else if (Physics.Linecast(alvo[indice].transform.position, camPosRotacao, out hit))
		{
			transform.position = Vector3.Lerp(transform.position, hit.point, (VelocidadeCamera * MultiCamVelo) * Time.smoothDeltaTime);
		}

		if (RotacionarNoJogador)
		{
			alvo[indice].transform.rotation = rotacao;
		} 
			

		//posicoes[indice].transform.rotation = rotacao;
		//Vector3 negDistance = new Vector3(0.0f, 0.0f, Mathf.Lerp(5, -distance, VelocidadeCamera * Time.deltaTime));
		//Vector3 position = rotacao * negDistance + alvo[indice].transform.position;
		
		//transform.rotation = rotacao;
		//transform.position = position;
		// transform.position = Vector3.Slerp(transform.position, newPos, SmoothFactor);

		if (LookAtPlayer || RotacionarNoJogador)
		{
			transform.LookAt(alvo[indice].transform);
		}
	}
	// Use this for initialization
	
	
	// Update is called once per frame
	void Update ()
	{
		if (Input.GetKeyDown("e") && indice < (posicoes.Length - 1))
		{
			indice++;
		}
		else if (Input.GetKeyDown("e") && indice >= (posicoes.Length - 1))
		{
			indice = 0;
		}
	}
	
	public static float ClampAngle(float angle, float min, float max)
	{
		if (angle < -360F)
			angle += 360F;
		if (angle > 360F)
			angle -= 360F;

		return Mathf.Clamp(angle, min, max);
	}

	bool HasMouseMoved()
	{
		return (Input.GetAxis("Mouse X") != 0) || (Input.GetAxis("Mouse Y") != 0);
	}

	private void OnControllerColliderHit(ControllerColliderHit hit)
	{
		Debug.DrawRay(hit.point, hit.normal, Color.red, 1.25f);
	}
}
