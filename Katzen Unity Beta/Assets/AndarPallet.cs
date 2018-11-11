using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AndarPallet : MonoBehaviour {
    public Animator animPallet;
    // Use this for initialization
    void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            animPallet.SetFloat("Acoes", 2);
        }
    }
}
