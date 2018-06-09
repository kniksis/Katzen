using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AtirarNoJogador : MonoBehaviour {

	public float fireRate = 0.5f;
	public float nextFire = 0.0f;
	public Transform respawnTiro;
	public GameObject tiroInimigo;
	public bool jogEntrou;

	// Use this for initialization
	void Start () {
	}
	
	// Update is called once per frame
	void Update () {
		if (jogEntrou)
		{
			if (Time.time > nextFire)
			{
				nextFire = Time.time + fireRate;
				Instantiate(tiroInimigo, respawnTiro.position, respawnTiro.rotation);
			}
		}
	}


	private void OnTriggerEnter(Collider col)
	{
		if (col.CompareTag("Player"))
		{
			jogEntrou = true;
		}
	}

	private void OnTriggerExit(Collider col)
	{
		if (col.CompareTag("Player"))
		{
			jogEntrou = false;
		}
	}
}
