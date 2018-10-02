using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class DronePatrulha : MonoBehaviour {

    [SerializeField]
    bool _patrolWaiting;

    [SerializeField]
    float _totalWaitTime = 3f;

    [SerializeField]
    float _switchProbability = 0.2f;

    [SerializeField]
    List<Waypoint> _patrolPoints;

    NavMeshAgent _naveMeshAgent;
    int _currentPatrolIndex;
    bool _travelling;
    bool _waiting;
    bool _patrolForward;
    float _waitTimer;

	// Use this for initialization
	void Start () {
        _naveMeshAgent = this.GetComponent<NavMeshAgent>();

        if(_naveMeshAgent == null)
        {
            Debug.LogError("O nav mesh agente não está atrelado ao " + gameObject.name);
        }

        else
        {
            if(_patrolPoints != null && _patrolPoints.Count >= 2)
            {
                _currentPatrolIndex = 0;
                SetDestination();
            }

            else
            {
                Debug.Log("Pontos de patrulha insuficientes para uma patrolha basica. ");
            }
        }
	}
	
	// Update is called once per frame
	void Update () {

        //checa se ele está proximo do destino
		if(_travelling && _naveMeshAgent.remainingDistance < 1.0f)
        {
            _travelling = false;
            
            //Se parada estiver ativa ele ira esperar
            if(_patrolWaiting)
            {
                _waiting = true;
                _waitTimer = 0f;
            }

            else
            {
                ChangePatrolPoint();
                SetDestination();
            }
        }

        if(_waiting)
        {
            _waitTimer += Time.deltaTime;
            if(_waitTimer >= _totalWaitTime)
            {
                _waiting = false;

                ChangePatrolPoint();
                SetDestination();
            }
        }
	}

    private void SetDestination()
    {
        if (_patrolPoints != null)
        {
            Vector3 targetVector = _patrolPoints[_currentPatrolIndex].transform.position;
            _naveMeshAgent.SetDestination(targetVector);
            _travelling = true;
        }
    }

    private void ChangePatrolPoint()
    {
        if(UnityEngine.Random.Range(0f, 1f) <= _switchProbability)
        {
            _patrolForward = !_patrolForward;
        }

        if(_patrolForward)
        {
            /*
            _currentPatrolIndex++;

            if(_currentPatrolIndex >= _patrolPoints.Count)
            {
                _currentPatrolIndex = 0;
            }*///A linha abaixo faz a mesma operação em apenas uma linha

            _currentPatrolIndex = (_currentPatrolIndex + 1) % _patrolPoints.Count;
        }

        else
        {
            if(--_currentPatrolIndex < 0)
            {
                _currentPatrolIndex = _patrolPoints.Count - 1;
            }
        }
    }
}
