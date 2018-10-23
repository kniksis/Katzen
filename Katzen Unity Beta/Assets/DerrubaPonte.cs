using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DerrubaPonte : MonoBehaviour
{
    public Animator animPonte;

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.CompareTag("Player"))
        {
            animPonte.SetBool("CairPonte", true);
        }
    }
}