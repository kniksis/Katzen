using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TiroJogador : MonoBehaviour {

    public int dano;
    [SerializeField]
    GameObject gameManagerGO;
    [SerializeField]
    GameManager gmScript;
    public float TempoDeVida;
    // Use this for initialization
    

    void Start () {

        gameManagerGO = GameObject.Find("Manager");
        gmScript = gameManagerGO.GetComponent<GameManager>();
        Destroy(gameObject, TempoDeVida);
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
