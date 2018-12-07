using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DerrubarArvore : MonoBehaviour {
    public Animator animArvore;
    public AudioSource somFonte;
    public AudioClip somClip;
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
            somFonte.clip = somClip;
            somFonte.Play();
            animArvore.SetBool("DerrubarArvore", true);
        }
    }
}
