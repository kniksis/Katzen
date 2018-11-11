using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DerrubarPallet : MonoBehaviour {
    public Animator animPallet;
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
            animPallet.SetFloat("Acoes", 1);
            Destroy(gameObject);
        }
    }
}
