using UnityEngine;
using System.Collections;

[AddComponentMenu("Camera-Control/Mouse Orbit with zoom")]

public class MouseOrbit : MonoBehaviour
{

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

	public float SmoothFactor = 0.5f;
	private RaycastHit hit;

	private Rigidbody rb;

	public bool RotacionarCam;

	float x = 0.0f;
	float y = 0.0f;

	// Use this for initialization
	void Start()
	{
		Vector3 angles = transform.eulerAngles;
		x = angles.y;
		y = angles.x;

		rb = GetComponent<Rigidbody>();

		// Make the rigid body not change rotation
		if (rb != null)
		{
			rb.freezeRotation = true;
		}
	}

	void LateUpdate()
	{
		if (alvo[indice])
		{
			if (RotacionarCam)
			{
				x += Input.GetAxis("Mouse X") * xSpeed * distance * 0.02f;
				y -= Input.GetAxis("Mouse Y") * ySpeed * 0.02f;

			y = ClampAngle(y, yMinLimit, yMaxLimit);
			}

			Quaternion rotation = Quaternion.Euler(y, x, 0);

			distance = Mathf.Clamp(distance - Input.GetAxis("Mouse ScrollWheel") * 5, distanceMin, distanceMax);
			
			if (Physics.Linecast(alvo[indice].transform.position, posicoes[indice].transform.position, out hit))
			{
				distance -= hit.distance;
			}

			Vector3 negDistance = new Vector3(0.0f, 0.0f, -distance);
			Vector3 position = rotation * negDistance + alvo[indice].transform.position;

			transform.rotation = rotation;
			transform.position = position;

			transform.LookAt(alvo[indice].transform);
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
}