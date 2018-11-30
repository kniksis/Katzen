using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AguaMataJogador : MonoBehaviour {

    GameObject gmGO;
    GameManager gmScript;

	// Use this for initialization
	void Start () {
        gmGO = GameObject.Find("Manager");
        gmScript = gmGO.GetComponent<GameManager>();
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag =="Player")
        {
            gmScript.DecreaseLife(1000);
        }
    }
}
