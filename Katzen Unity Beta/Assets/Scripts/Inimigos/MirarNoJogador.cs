using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MirarNoJogador : MonoBehaviour
{

	public Transform target;
	public bool jogEntrou;

	// Use this for initialization
	void Start()
	{
		jogEntrou = false;
	}

	// Update is called once per frame
	void Update()
	{
		if (jogEntrou)
		{
			Vector3 targetPostition = new Vector3(target.position.x,
											this.transform.position.y,
											target.position.z);
			transform.LookAt(targetPostition);
		}
	}
	private void OnTriggerEnter(Collider col)
	{
		if(col.CompareTag("Player"))
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
