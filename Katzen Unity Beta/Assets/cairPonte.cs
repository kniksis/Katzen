using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class cairPonte : MonoBehaviour {

	public GameObject Ponte1;
	public GameObject Ponte2;

	public float minAngle = 0.0f;
	public float maxAngle = 60.0f;

	public bool jogEntrou;

	// Use this for initialization
	void Start ()
	{
		jogEntrou = false;
	}
	
	// Update is called once per frame
	void Update () {
		if (jogEntrou)
		{
			Ponte1.transform.Rotate(Vector3.forward, 60);
			Ponte2.transform.Rotate(Vector3.forward, -60);

			Destroy(GetComponent<BoxCollider>());
			jogEntrou = false;
		}
	}

	private void OnTriggerEnter(Collider col)
	{
		if (col.CompareTag("Player"))
		{
			jogEntrou = true;
		}
	}

	private void OnTriggerExit(Collider col)
	{
		if (col.CompareTag("Player"))
		{
			jogEntrou = false;
		}
	}
}
