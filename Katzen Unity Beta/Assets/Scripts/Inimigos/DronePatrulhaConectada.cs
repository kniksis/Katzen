using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEngine;
using UnityEngine.AI;


namespace Assets.Code
{
    public class DronePatrulhaConectada : MonoBehaviour
    {
        [SerializeField]
        bool _patrolWaiting;

        [SerializeField]
        float _totalWaitTime = 3f;

        [SerializeField]
        float _switchProbability = 0.2f;

        NavMeshAgent _naveMeshAgent;
        [SerializeField]
        ConnectedWaypoint _currentWaypoint;
        ConnectedWaypoint _previousWaypoint;

        bool _travelling;
        bool _waiting;
        float _waitTimer;
        int _waypointsVisited;

        // Use this for initialization
        void Start()
        {
            _naveMeshAgent = this.GetComponent<NavMeshAgent>();

            if (_naveMeshAgent == null)
            {
                Debug.LogError("O nav mesh agente não está atrelado ao " + gameObject.name);
            }

            else
            {
                if (_currentWaypoint == null)
                {
                    GameObject[] allWaypoints = GameObject.FindGameObjectsWithTag("Waypoint");

                    if (allWaypoints.Length > 0)
                    {
                        while (_currentWaypoint == null)
                        {
                            int random = UnityEngine.Random.Range(0, allWaypoints.Length);
                            ConnectedWaypoint startingWaypoint = allWaypoints[random].GetComponent<ConnectedWaypoint>();

                            if (startingWaypoint != null)
                            {
                                _currentWaypoint = startingWaypoint;
                            }
                        }
                    }

                    else
                    {
                        Debug.LogError("Falha para encontrar algum waypoint para usar na cena.");
                    }
                }

                SetDestination();
            }
        }

        // Update is called once per frame
        void Update()
        {

            //checa se ele está proximo do destino
            if (_travelling && _naveMeshAgent.remainingDistance < 1.0f)
            {
                _travelling = false;
                _waypointsVisited++;

                //Se parada estiver ativa ele ira esperar
                if (_patrolWaiting)
                {
                    _waiting = true;
                    _waitTimer = 0f;
                }

                else
                {
                    SetDestination();
                }
            }

            if (_waiting)
            {
                _waitTimer += Time.deltaTime;
                if (_waitTimer >= _totalWaitTime)
                {
                    _waiting = false;

                    SetDestination();
                }
            }
        }

        private void SetDestination()
        {
            if (_waypointsVisited > 0)
            {
                ConnectedWaypoint nextWaypoint = _currentWaypoint.NextWaypoint(_previousWaypoint);
                _previousWaypoint = _currentWaypoint;
                _currentWaypoint = nextWaypoint;
            }

            Vector3 targetVector = _currentWaypoint.transform.position;
            _naveMeshAgent.SetDestination(targetVector);
            _travelling = true;
        }
    }
}