using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoverTiro : MonoBehaviour {

	public float speed;
	public float tempoDeVida;
	public float tempoDeVidaMax;

	// Use this for initialization
	void Start ()
	{

	}
	
	// Update is called once per frame
	void Update ()
	{
		transform.position += transform.forward * Time.fixedDeltaTime * speed;
		tempoDeVida += 1.0f * Time.fixedDeltaTime;

		if (tempoDeVida > tempoDeVidaMax)
		{
			gameObject.SetActive(false);
			tempoDeVida = 0;
		}
	}
}
