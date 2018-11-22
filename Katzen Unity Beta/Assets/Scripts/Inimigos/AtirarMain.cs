using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AtirarMain : MonoBehaviour {

	AtirarNoJogador gop;

	[SerializeField]
	GameObject AtirarNoJogadorGO;
	[SerializeField]
	AtirarNoJogador anjScript;

	void Awake()
	{
		AtirarNoJogadorGO = GameObject.Find("Canhao");
		anjScript = AtirarNoJogadorGO.GetComponent<AtirarNoJogador>();
	}

	void Start ()
	{
        //gop = AtirarNoJogador.Instancia;
	}
	
	// Update is called once per frame
	void Update () {

		/*if (anjScript.atirar == true)
		{
			Debug.Log("To atirando, seu Animal!");

			//GameObject temp = gop.ObterObjeto();
   //         if(temp != null)
   //         {
   //             temp.transform.position = anjScript.respawnTiro.position;
   //             temp.SetActive(true);
   //         }
        }*/
	}
}
