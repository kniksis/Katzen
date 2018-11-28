using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SonsBT : MonoBehaviour {

    public AudioSource BTAudioSource;
    public AudioClip hoverBRSom;
    public AudioClip clickBRSom;

    public void HoverSound()
    {
        BTAudioSource.PlayOneShot(hoverBRSom);
    }

    public void ClickSound()
    {
        BTAudioSource.PlayOneShot(clickBRSom);
    }
}
