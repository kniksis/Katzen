using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SeguirPlataforma : MonoBehaviour{

    public GameObject Jogador;

    private void Awake()
    {
        Jogador = GameObject.Find("Katzen Character");
    }
    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            Jogador.transform.parent = transform;
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if(other.gameObject == Jogador)
        {
            Jogador.transform.parent = null;
        }
    }
}
