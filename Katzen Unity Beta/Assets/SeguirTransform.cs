using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SeguirTransform : MonoBehaviour {
    public Transform target;

    private void LateUpdate()
    {
        transform.position = target.position;
        transform.rotation = target.rotation;
    }
}
