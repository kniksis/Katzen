using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Raycast3 : MonoBehaviour {

	static float distance3 = 5;


	void Update()
	{
		RaycastHit hit;
		if (Physics.Raycast(transform.position, transform.TransformDirection(Vector3.forward), out hit))
		{
			distance3 = hit.distance;
		}
	}
}
