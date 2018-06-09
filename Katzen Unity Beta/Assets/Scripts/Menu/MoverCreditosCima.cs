using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoverCreditosCima : MonoBehaviour {

	public GameObject textoCreditos;
	public float velocidadeY;
	RectTransform texCreRect;

	// Use this for initialization
	void Start () {
		texCreRect = textoCreditos.GetComponent<RectTransform>();
	}
	
	// Update is called once per frame
	void Update () {
		if (texCreRect.localPosition.y <= 842)
		{
			texCreRect.localPosition += new Vector3(0, velocidadeY);
		}
		else
		{
			texCreRect.localPosition = new Vector3(0, -700);
		}
	}

	public void AumentarVelocidade(float velo = 0.0f)
	{
		velocidadeY = velo;
	}
}
