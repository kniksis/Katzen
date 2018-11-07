﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ControleShader : MonoBehaviour {
    Renderer rend;
    Material mat;
    Shader shad;
    GameObject go;
    float quantTerra = 1.0f;
    public float AddQuantTerra;
    bool EstaSujando = false;

    // Use this for initialization
    void Start () {
        rend = go.GetComponent<Renderer>();
        mat = (Material)Resources.Load("Materiais/KatzenCorpoMat", typeof(Material));
        shad = (Shader)Resources.Load("Shaders/KatzenShader", typeof(Shader));
        rend.material.shader = shad;
	}
	
	// Update is called once per frame
	void Update () {
        
        //rend.material.SetFloat("_TerraQuantidade", test);
	}

    void addTerra ()
    {
        if(EstaSujando)
        {
            if(quantTerra > 0.0001)
            quantTerra = quantTerra - AddQuantTerra;
            if(quantTerra < 0.0001)
            {
                quantTerra = 0.0001f;
            }
        }
        else
        {
            if (quantTerra < 1)
                quantTerra = quantTerra + (AddQuantTerra * 2.0f);
            if (quantTerra > 1)
            {
                quantTerra = 1;
            }
        }
    }

    void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Terra")
        {
            EstaSujando = true;
            rend.material.SetFloat("_TerraQuantidade", quantTerra);
        }

        if (other.gameObject.tag == "Agua")
        {
            EstaSujando = false;
            rend.material.SetFloat("_TerraQuantidade", quantTerra);
        }
    }
}
