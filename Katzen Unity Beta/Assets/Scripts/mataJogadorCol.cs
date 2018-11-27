using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class mataJogadorCol : MonoBehaviour {

    public int dano;
    GameObject gameManagerGO;
    GameManager gmScript;
    [SerializeField]
    GameObject jogadorGO;
    [SerializeField]
    JogCharacterMov jogScript;
    public float lifeTime;
    public Vector3 direcao;
    public Vector3 danoSource;
    Transform mataJogadorGO;

    // Use this for initialization
    void Start () {
        gameManagerGO = GameObject.Find("Manager");
        gmScript = gameManagerGO.GetComponent<GameManager>();
        jogadorGO = GameObject.Find("Katzen Character");
        jogScript = jogadorGO.GetComponent<JogCharacterMov>();
        Destroy(gameObject, lifeTime);
    }
	
	// Update is called once per frame
	void Update () {
        danoSource = transform.position;
	}

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            jogScript.ReceberDano(danoSource);
            gmScript.DecreaseLife(dano);
            Destroy (gameObject);
        }
    }
}