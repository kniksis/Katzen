using UnityEngine;
using System.Collections;
public class LaserSight : MonoBehaviour
{
	public Color corLaserInicio = new Color(0.3f, 0.0f, 0.0f, 1.0f);
	public Color corLaserFinal = Color.black;
	public int DistanciaDoLaser = 100;
	public float LarguraInicial = 0.02f, LarguraFinal = 0.02f;
	private GameObject luzColisao;
	public bool ligado;

	void Start()
	{
		luzColisao = new GameObject();
		luzColisao.AddComponent<Light>();
		luzColisao.GetComponent<Light>().intensity = 8;
		luzColisao.GetComponent<Light>().bounceIntensity = 8;
		luzColisao.GetComponent<Light>().range = LarguraFinal * 100;
		luzColisao.GetComponent<Light>().color = new Color(0.1f, 0.0f, 0.0f, 1.0f);
		//
		LineRenderer lineRenderer = gameObject.AddComponent<LineRenderer>();
		lineRenderer.material = new Material(Shader.Find("Particles/Additive"));
		lineRenderer.SetColors(corLaserInicio, corLaserFinal);
		lineRenderer.SetWidth(LarguraInicial, LarguraFinal);
		lineRenderer.SetVertexCount(2);
	}
	void Update()
	{
		if (ligado == true)
		{
			luzColisao.SetActive(true);
			Vector3 PontoFinalDoLaser = transform.position + transform.forward * DistanciaDoLaser;
			RaycastHit PontoDeColisao;

			if (Physics.Raycast(transform.position, transform.forward, out PontoDeColisao, DistanciaDoLaser))
			{
				GetComponent<LineRenderer>().SetPosition(0, transform.position);
				GetComponent<LineRenderer>().SetPosition(1, PontoDeColisao.point);
				float distancia = Vector3.Distance(transform.position, PontoDeColisao.point) - 0.03f;
				luzColisao.transform.position = transform.position + transform.forward * distancia;
			}
			else
			{
				GetComponent<LineRenderer>().SetPosition(0, transform.position);
				GetComponent<LineRenderer>().SetPosition(1, PontoFinalDoLaser);
				luzColisao.transform.position = PontoFinalDoLaser;
			}
		}

		else
		{
			GetComponent<LineRenderer>().SetPosition(0, transform.position);
			GetComponent<LineRenderer>().SetPosition(1, transform.position);
			luzColisao.SetActive(false);
		}

		if (Input.GetKeyDown("f"))
		{
			ligado = !ligado;
		}
	}
}