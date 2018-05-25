using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DerrubarArvore : MonoBehaviour {
    public GameObject ColisorArvore;
    public GameObject Arvore;
    public float turnSpeed = 50f;
    public float x = -90;
    public bool cairArvore;

    // Use this for initialization
    void Start () {
        cairArvore = false;
		
	}
	
	// Update is called once per frame
	void Update () {
        if (cairArvore)
        {
            if (x <= 0)
            {
                x += Time.deltaTime * 40;
                Arvore.transform.rotation = Quaternion.Euler(x, -125, 0);
            }
        }
    }
}
