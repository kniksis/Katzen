using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AtirarNoJogador : MonoBehaviour {

    GameObjectPool gop;
	[SerializeField]
	GameObject jogEntrouMiraGO;
	[SerializeField]
	JogEntrouMira jemScript;
    

	public float fireRate = 0.5f;
	public float nextFire = 0.0f;
	public Transform respawnTiro;
    

	public bool atirar;


	// Use this for initialization
	void Awake()
	{
		jogEntrouMiraGO = GameObject.Find("MiraInimigo");
		jemScript = jogEntrouMiraGO.GetComponent<JogEntrouMira>();

		atirar = false;
	}

	void Start () {
        gop = GameObjectPool.Instancia;
	}
    
	// Update is called once per frame
	void Update () {
		//atirar = false;
		if (jemScript.jogEntrou == true)
		{
			//atirar = false;
			if (Time.time > nextFire)
			{
				nextFire = Time.time + fireRate;
                //atirar = true;
                GameObject temp = gop.ObterObjeto();
                if(temp != null)
                {
                    temp.transform.position = respawnTiro.transform.position;
                    temp.transform.rotation = respawnTiro.transform.rotation;
                    temp.SetActive(true);
                }
			}
		}
	}
}
