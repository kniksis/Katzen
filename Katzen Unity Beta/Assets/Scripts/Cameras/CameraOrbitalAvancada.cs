using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraOrbitalAvancada : MonoBehaviour
{

	public GameObject[] alvo;
	public GameObject[] posicaoCam;
	private int indiceCameras = 0;
	private GameObject[] posicaoOriginalCameras;

	public Transform JogadorTransform;
	private Vector3 _cameraOffset;
	
	private float[] xOrbit, yOrbit, distanciaCameraOrbit;
	private bool orbitalAtiv;

	[Range(1, 20)] public float velocidadeCameraSeguir = 5.0f;
	[Range(1, 30)] public float velocidadeCameraGirar = 15.0f;

	private float tempoOrbit = 0.0f;
	[Range(0.1f, 1.0f)] public float SmoothFactor = 0.5f;
	[Range(0.01f, 2.0f)] public float sensibilidade = 0.8f;
	[Range(1.0f, 100.0f)] public float velocidadeScrool = 50.0f;
	[Range(1.0f, 100.0f)] public float velocidadeY = 10.0f;
	[Range(3.0f, 20.0f)] public float distanciaMinima = 5.0f;
	[Range(20.0f, 1000.0f)] public float distanciaMaxima = 50.0f;

	private RaycastHit hit;


	public bool LookAtPlayer = false;

	public bool RotacionarNoJogador = true;
	public float RotacionarVelocidade = 5.0f;
	
	public static float ClampAngle(float angulo, float min, float max)
	{
		if (angulo < -360F) { angulo += 360F; }
		if (angulo > 360F) { angulo -= 360F; }
		return Mathf.Clamp(angulo, min, max);
	}

	private void Awake()
	{
		posicaoOriginalCameras = new GameObject[posicaoCam.Length];
		xOrbit = new float[posicaoCam.Length];
		yOrbit = new float[posicaoCam.Length];
		distanciaCameraOrbit = new float[posicaoCam.Length];
		for (int x = 0; x < posicaoCam.Length; x++)
		{
			distanciaCameraOrbit[x] = distanciaMinima;
			xOrbit[x] = posicaoCam[x].transform.eulerAngles.x;
			yOrbit[x] = posicaoCam[x].transform.eulerAngles.y;
			//
			posicaoOriginalCameras[x] = new GameObject("posicaoDaCameraSeguir" + x);
			posicaoOriginalCameras[x].transform.parent = transform;
			posicaoOriginalCameras[x].transform.localPosition = posicaoCam[x].transform.localPosition;
			//
			transform.gameObject.layer = 2;
			foreach (Transform trans in this.gameObject.GetComponentsInChildren<Transform>(true))
			{
				trans.gameObject.layer = 2;
			}

			AudioListener captadorDeSom = posicaoCam[x].GetComponent<AudioListener>();
			if (captadorDeSom == null)
			{
				posicaoCam[x].transform.gameObject.AddComponent(typeof(AudioListener));
			}
		}
	}
	void FixedUpdate()
	{
		//transform.LookAt (alvo[indice].transform);
	}

	void Start()
	{
		if (posicaoCam.Length > 0)
		{
			for (int x = 0; x < posicaoCam.Length; x++)
			{
				if (x == indiceCameras)
				{
					posicaoCam[x].gameObject.SetActive(true);
				}
				else
				{
					posicaoCam[x].gameObject.SetActive(false);
				}
			}
		}
	}

	void LateUpdate()
	{
		float velocidadeTimeScale = 1.0f / Time.timeScale;

		float movX = Input.GetAxis("Mouse X");
		float movY = Input.GetAxis("Mouse Y");
		float movZ = Input.GetAxis("Mouse ScrollWheel");

		if (movX > 0.0f || movY > 0.0f || movZ > 0.0f)
		{
			orbitalAtiv = true;
			tempoOrbit = 0.0f;
		}
		else
		{
			tempoOrbit += Time.deltaTime;
		}

		if (tempoOrbit > 3.0f)
		{
			tempoOrbit = 3.1f;
			orbitalAtiv = false;
		}

		if (orbitalAtiv == true)
		{
			if (!Physics.Linecast(transform.position, posicaoCam[indiceCameras].transform.position))
			{

			}
			else if (Physics.Linecast(transform.position, posicaoCam[indiceCameras].transform.position, out hit))
			{
				distanciaCameraOrbit[indiceCameras] = Vector3.Distance(transform.position, hit.point);
				distanciaMinima = Mathf.Clamp((Vector3.Distance(transform.position, hit.point)), distanciaMinima * 0.5f, distanciaMaxima);
			}
			xOrbit[indiceCameras] += movX * (sensibilidade * distanciaCameraOrbit[indiceCameras]) / (distanciaCameraOrbit[indiceCameras] * 0.5f);
			yOrbit[indiceCameras] -= movY * sensibilidade * velocidadeY;
			yOrbit[indiceCameras] = ClampAngle(yOrbit[indiceCameras], 0.0f, 85.0f);

			Quaternion _rotation = Quaternion.Euler(yOrbit[indiceCameras], xOrbit[indiceCameras], 0);
			distanciaCameraOrbit[indiceCameras] = Mathf.Clamp(distanciaCameraOrbit[indiceCameras] - movZ * velocidadeScrool, distanciaMinima, distanciaMaxima);
			Vector3 _negDistance = new Vector3(0.0f, 0.0f, -distanciaCameraOrbit[indiceCameras]);
			Vector3 _position = _rotation * _negDistance + transform.position;
			Vector3 _posicAtual = posicaoCam[indiceCameras].transform.position;
			Quaternion _rotacAtual = posicaoCam[indiceCameras].transform.rotation;
			posicaoCam[indiceCameras].transform.rotation = Quaternion.Lerp(_rotacAtual, _rotation, Time.deltaTime * 5.0f * velocidadeTimeScale);
			posicaoCam[indiceCameras].transform.position = Vector3.Lerp(_posicAtual, _position, Time.deltaTime * 5.0f * velocidadeTimeScale);
		}
		else
		{
			RaycastHit __hit;
			float velocidade = velocidadeCameraSeguir;
			if (!Physics.Linecast(transform.position, posicaoOriginalCameras[indiceCameras].transform.position))
			{
				posicaoCam[indiceCameras].transform.position = Vector3.Lerp(posicaoCam[indiceCameras].transform.position, posicaoOriginalCameras[indiceCameras].transform.position, Time.deltaTime * velocidade);
			}
			else if (Physics.Linecast(transform.position, posicaoOriginalCameras[indiceCameras].transform.position, out __hit))
			{
				posicaoCam[indiceCameras].transform.position = Vector3.Lerp(posicaoCam[indiceCameras].transform.position, __hit.point, Time.deltaTime * velocidade);
			}
			//camera rodar 
			float __velocidadeGir = velocidadeCameraGirar;
			var __newRotation = Quaternion.LookRotation(transform.position - posicaoCam[indiceCameras].transform.position, Vector3.up);
			posicaoCam[indiceCameras].transform.rotation = Quaternion.Slerp(posicaoCam[indiceCameras].transform.rotation, __newRotation, Time.deltaTime * __velocidadeGir);
		}

		/*
		if (RotacionarNoJogador)
		{
			Quaternion camTurnAgleX = Quaternion.AngleAxis(Input.GetAxis("Mouse X") * RotacionarVelocidade, Vector3.up);

			_cameraOffset = camTurnAgleX * _cameraOffset;
		}

		Vector3 newPos = alvo[indiceCameras].transform.position + _cameraOffset;

		if (!Physics.Linecast(alvo[indiceCameras].transform.position, posicaoCam[indiceCameras].transform.position))
		{
			transform.position = Vector3.Slerp(transform.position, posicaoCam[indiceCameras].transform.position, SmoothFactor * Time.deltaTime);
		}
		else if (Physics.Linecast(alvo[indiceCameras].transform.position, posicaoCam[indiceCameras].transform.position, out hit))
		{
			transform.position = Vector3.Slerp(transform.position, hit.point, (SmoothFactor * 2) * Time.deltaTime);
		}

		transform.position = Vector3.Slerp(transform.position, newPos, SmoothFactor);

		if (LookAtPlayer || RotacionarNoJogador)
		{
			transform.LookAt(alvo[indiceCameras].transform);
		}*/
	}
	// Use this for initialization


	// Update is called once per frame
	void Update()
	{
		if (Input.GetKeyDown("e") && indiceCameras < (posicaoCam.Length - 1))
		{
			indiceCameras++;
		}
		else if (Input.GetKeyDown("e") && indiceCameras >= (posicaoCam.Length - 1))
		{
			indiceCameras = 0;
		}
	}
}
