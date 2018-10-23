using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DestruirPorTiro : MonoBehaviour {

    GameObject derrubarArvoreGO;
    DerrubarArvore daScript;

    // Use this for initialization
    void Start () {
        derrubarArvoreGO = GameObject.Find("Fallen Tree");
        daScript = derrubarArvoreGO.GetComponent<DerrubarArvore>();
    }
	
	// Update is called once per frame
	void Update () {
		
	}

	private void OnTriggerEnter(Collider other)
	{
		if(other.CompareTag("TiroJogador"))
		{
            Destroy(gameObject);
		}
	}
}
