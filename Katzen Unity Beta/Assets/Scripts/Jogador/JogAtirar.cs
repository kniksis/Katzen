using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JogAtirar : MonoBehaviour {

	public float fireRate = 0.5f;
	public float nextFire = 0.0f;
	public Transform respawnTiro;
	public GameObject tiroInimigo;
	bool fire;

	GameObject gameManagerGO;
	GameManager gmScript;

	// Use this for initialization
	void Start () {
		gameManagerGO = GameObject.Find("Manager");
		gmScript = gameManagerGO.GetComponent<GameManager>();
	}
	
	// Update is called once per frame
	void Update () {
		fire = Input.GetButton("Fire1");

		if (fire && gmScript.municao > 0 && gmScript.InventarioHUD.active != true)
		{
			if (Time.time > nextFire)
			{
				nextFire = Time.time + fireRate;
				Instantiate(tiroInimigo, respawnTiro.position, respawnTiro.rotation);
				gmScript.DecreaseMunicao();
			}
		}
	}
}
