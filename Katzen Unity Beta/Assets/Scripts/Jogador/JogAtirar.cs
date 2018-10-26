using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JogAtirar : MonoBehaviour {

	public float fireRate = 0.5f;
	public float nextFire = 0.0f;
	public Transform respawnTiro;
	public Rigidbody tiro;

    public float forcaAtual;
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
		fire = Input.GetButton("Atirar");

        if (fire)
        {
            if (Time.time > nextFire)
            {
                nextFire = Time.time + fireRate;
                //atirar = true;
                //GameObject temp = gop.ObterObjeto();
                //if(temp != null)
                //{
                //temp.transform.position = respawnTiro.transform.position;
                //temp.transform.rotation = respawnTiro.transform.rotation;
                //temp.SetActive(true);

                Rigidbody tiroInstancia = Instantiate(tiro, respawnTiro.position, respawnTiro.rotation) as Rigidbody;

                tiroInstancia.velocity = forcaAtual * respawnTiro.forward;
                //}
            }
        }
    }
}
