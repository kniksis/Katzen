using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DerrubarArvore : MonoBehaviour {
    public Animator animArvore;
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("TiroJogador"))
        {
            animArvore.SetBool("DerrubarArvore", true);
        }
    }
}
