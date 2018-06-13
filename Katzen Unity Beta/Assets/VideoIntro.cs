using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class VideoIntro : MonoBehaviour
{
    [SerializeField]
    string proximaCena;

    [SerializeField]
    float tempoProxCena = 10.0f;

	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        tempoProxCena -= Time.deltaTime;
        if(tempoProxCena <= 0.0f)
        {
            Application.LoadLevel(proximaCena);
        }
	}
}
