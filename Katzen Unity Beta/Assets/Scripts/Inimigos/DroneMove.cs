using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class DroneMove : MonoBehaviour {

    [SerializeField]
    Transform _destination;
    NavMeshAgent _naveMeshAgente;

	// Use this for initialization
	void Start () {
        _naveMeshAgente = this.GetComponent<NavMeshAgent>();

        if(_naveMeshAgente == null)
        {
            Debug.LogError("O nav mesh agente não está atrelado ao " + gameObject.name);
        }

        else
        {
            SetDestination();
        }
	}
	
	// Update is called once per frame
	void Update () {
		
	}

    private void SetDestination()
    {
        if(_destination != null)
        {
            Vector3 targetVector = _destination.transform.position;
            _naveMeshAgente.SetDestination(targetVector);
        }
    }
}
