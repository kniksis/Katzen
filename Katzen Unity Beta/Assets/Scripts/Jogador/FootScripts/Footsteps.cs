using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Footsteps : MonoBehaviour {
    public GameObject righFootprint;
    public GameObject leftFootprint;

    public Transform rightFootLocation;
    public Transform leftFootLocation;

    public AudioSource leftFootAudioSource;
    public AudioSource rightFootAudioSource;

    public float footPrintOffset = 0.05f;

    void LeftFootstep()
    {
        leftFootAudioSource.Play();

        RaycastHit hit;

        if(Physics.Raycast(leftFootLocation.position, leftFootLocation.forward, out hit))
        {
            Instantiate(leftFootprint, hit.point + hit.normal * footPrintOffset, Quaternion.LookRotation(hit.normal, leftFootLocation.up));
        }
    }

    void RightFootstep()
    {
        rightFootAudioSource.Play();

        RaycastHit hit;

        if (Physics.Raycast(rightFootLocation.position, rightFootLocation.forward, out hit))
        {
            Instantiate(righFootprint, hit.point + hit.normal * footPrintOffset, Quaternion.LookRotation(hit.normal, rightFootLocation.up));
        }
    }
}
