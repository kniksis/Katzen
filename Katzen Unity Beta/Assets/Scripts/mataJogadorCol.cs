using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class mataJogadorCol : MonoBehaviour {

    public int dano;
    GameObject gameManagerGO;
    GameManager gmScript;

    // Use this for initialization
    void Start () {
        gameManagerGO = GameObject.Find("Manager");
        gmScript = gameManagerGO.GetComponent<GameManager>();
    }
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnCollisionEnter(Collision collision)
    {
        if (collision.gameObject.CompareTag("Player"))
        {
            gmScript.DecreaseLife(dano);
        }
    }
}
