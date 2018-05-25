using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadPlayer : MonoBehaviour {

	// Use this for initialization
	void Start () {
		if(PlayerPrefs.HasKey("STH"))
        {
            /*
            transform.position = new Vector3(PlayerPrefs.GetFloat("Sh"), PlayerPrefs.GetFloat("ShY"), 0);
            */
            transform.position = PlayerPrefsX.GetVector3("STH");
        }
    }

    private void OnTriggerEnter(Collider collision)
    {
        if (collision.CompareTag("Save"))
        {
            Debug.Log("Salve o mundo!");
            /*
            PlayerPrefs.SetFloat("Sh", transform.position.x);
            PlayerPrefs.SetFloat("ShY", transform.position.y);
            */
            PlayerPrefsX.SetVector3("STH", transform.position);
            
            PlayerPrefs.Save();

            Debug.Log("Salvou o MUNDO!");
        }
    }

    // Update is called once per frame
    void Update () {
		
	}
}
