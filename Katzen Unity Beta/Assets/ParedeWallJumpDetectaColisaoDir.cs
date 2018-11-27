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
        paredeRender = gameObject.GetComponent<Renderer>();
        CorOriginal = paredeRender.material.color;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnDisable()
    {
        paredeRender.material.color = CorOriginal;
    }

    public void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player" && gameObject.layer == 11)
        {
            jogadorColidiuDir = true;
            paredeRender.material.color = Color.Lerp(CorOriginal, Color.yellow, 3.0f);
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Player" && gameObject.layer == 0)
        {
            jogadorColidiuDir = false;
            paredeRender.material.color = Color.Lerp(CorOriginal, Color.white, 3.0f);
        }
    }

    public void OnTriggerExit(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            jogadorColidiuDir = false;
            paredeRender.material.color = Color.Lerp(Color.yellow, CorOriginal, 3.0f);
        }
    }
}
