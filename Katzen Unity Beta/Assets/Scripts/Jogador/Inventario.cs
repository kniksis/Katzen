using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Inventario : MonoBehaviour {

    public GameObject[] Itens;
    public Vector3 position = new Vector3(1.0f, 1.0f, 1.0f);
    public Quaternion rotation = new Quaternion(0.0f, 0.0f, 0.0f, 0.0f);
    public GameObject parentGameObject;

	// Use this for initialization
	void Start () {
        (Instantiate(Itens[0], position, rotation) as GameObject).transform.parent = parentGameObject.transform;
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
