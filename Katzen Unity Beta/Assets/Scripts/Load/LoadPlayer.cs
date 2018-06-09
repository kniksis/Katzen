using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LoadPlayer : MonoBehaviour {

	GameObject gameManagerGO;
	GameManager gmScript;
	int x;

	// Use this for initialization
	void Start ()
	{
		gameManagerGO = GameObject.Find("Manager");
		gmScript = gameManagerGO.GetComponent<GameManager>();

		if (PlayerPrefs.HasKey("Save1"))
        {
            /*
            transform.position = new Vector3(PlayerPrefs.GetFloat("Sh"), PlayerPrefs.GetFloat("ShY"), 0);
            */
            transform.position = PlayerPrefsX.GetVector3("Save1");
			gmScript.life = PlayerPrefs.GetInt("SaveLife");
			gmScript.SetLife();
			gmScript.municao = PlayerPrefs.GetInt("SaveMunicao");
			gmScript.SetMunicao();
			gmScript.money = PlayerPrefs.GetInt("SaveMoney");
			gmScript.SetMoney();
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
            PlayerPrefsX.SetVector3("Save1", transform.position);
			PlayerPrefs.SetInt("SaveLife", gmScript.life);
			PlayerPrefs.SetInt("SaveMunicao", gmScript.municao);
			PlayerPrefs.SetInt("SaveMoney", gmScript.money);

			PlayerPrefs.Save();

            Debug.Log("Salvou o MUNDO!");
        }
    }

    // Update is called once per frame
    void Update () {
		
	}
}
