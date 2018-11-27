using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ParedeWallJumpDetectaColisaoEsq : MonoBehaviour {

    public bool jogadorColidiuEsq;
    private Renderer paredeRender;
    private Color CorOriginal;
	// Use this for initialization
	void Start () {
        jogadorColidiuEsq = false;
        paredeRender = gameObject.GetComponent<Renderer>();
        CorOriginal = paredeRender.material.color;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player" && gameObject.layer == 11)
        {
            jogadorColidiuEsq = true;
            paredeRender.material.color = Color.Lerp(CorOriginal, Color.yellow, 3.0f);
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Player" && gameObject.layer == 0)
        {
            jogadorColidiuEsq = false;
            paredeRender.material.color = Color.Lerp(CorOriginal, Color.white, 3.0f);
        }
    }

    public void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            jogadorColidiuEsq = false;
            paredeRender.material.color = Color.Lerp(Color.yellow, CorOriginal, 1.0f);
        }
    }
}
