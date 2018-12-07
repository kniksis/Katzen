using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class trocarMusicaBoss : MonoBehaviour {
    public AudioSource MusicaSorce;
    public AudioClip musicaBoss;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void OnTriggerEnter(Collider other)
    {
        if(other.gameObject.tag == "Player")
        {
            MusicaSorce.clip = musicaBoss;
            MusicaSorce.Play();
        }
    }
}
