using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ParedeWallJumpDetectaColisaoDir : MonoBehaviour {

    public bool jogadorColidiuDir;
    private Renderer paredeRender;
    private Color CorOriginal;
	// Use this for initialization
	void Start () {
        jogadorColidiuDir = false;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player" && gameObject.layer == 11)
        {
            jogadorColidiuDir = true;
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Player" && gameObject.layer == 0)
        {
            jogadorColidiuDir = false;
        }
    }

    public void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            jogadorColidiuDir = false;
        }
    }
}
