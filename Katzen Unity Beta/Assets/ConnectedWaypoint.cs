using System.Collections;
using System.Collections.Generic;
using System.Text;
using UnityEngine;

namespace Assets.Code
{
    public class ConnectedWaypoint : Waypoint
    {

        [SerializeField]
        protected float _connectivityRadius = 50f;

        List<ConnectedWaypoint> _connections;

        // Use this for initialization
        void Start()
        {

            //captura todos os Waypoint da cena
            GameObject[] allWaypoints = GameObject.FindGameObjectsWithTag("Waypoint");

            //Cria uma lista de waypoints para referenciar mais tarde
            _connections = new List<ConnectedWaypoint>();

            //Chega se os ha conecxao entre os waypoints
            for (int i = 0; i < allWaypoints.Length; i++)
            {
                ConnectedWaypoint nextWaypoint = allWaypoints[i].GetComponent<ConnectedWaypoint>();

                if (nextWaypoint != null)
                {
                    if (Vector3.Distance(this.transform.position, nextWaypoint.transform.position) <= _connectivityRadius && nextWaypoint != this)
                    {
                        _connections.Add(nextWaypoint);
                    }
                }
            }
        }

        public override void OnDrawGizmoss()
        {
            Gizmos.color = Color.cyan;
            Gizmos.DrawWireSphere(transform.position, debugDrwaRadios);

            Gizmos.color = Color.magenta;
            Gizmos.DrawWireSphere(transform.position, _connectivityRadius);
        }

        public ConnectedWaypoint NextWaypoint(ConnectedWaypoint previousWaypoint)
        {
            if (_connections.Count == 0)
            {
                Debug.LogError("Waypoint insuficientes");
                return null;
            }

            else if (_connections.Count == 1 && _connections.Contains(previousWaypoint))
            {
                //Usa o waypoint se ele for o proximo a ele.
                return previousWaypoint;
            }

            else//subtitui, procuranco um randomico se não tiver proximo.
            {
                ConnectedWaypoint nextWaypoint;
                int nexIndex = 0;

                do
                {
                    nexIndex = UnityEngine.Random.Range(0, _connections.Count);
                    nextWaypoint = _connections[nexIndex];

                }
                while (nextWaypoint == previousWaypoint);

                return nextWaypoint;
            }
        }
    }
}
