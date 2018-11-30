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
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player" && gameObject.layer == 11)
        {
            jogadorColidiuEsq = true;
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Player" && gameObject.layer == 0)
        {
            jogadorColidiuEsq = false;
        }
    }

    public void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            jogadorColidiuEsq = false;
        }
    }
}
