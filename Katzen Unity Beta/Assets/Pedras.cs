using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Pedras : MonoBehaviour {

	GameObject gameManagerGO;
	GameManager gmScript;
	[SerializeField]
	public Text quantidadeItemText;
	[SerializeField]
	public int quantidadeItemNum;
	bool esbarrou;

	// Use this for initialization
	void Awake () {
		gameManagerGO = GameObject.Find("Manager");
		quantidadeItemText = GameObject.Find("Canvas/ImgItemProximo/ImgFundoItem/TextQuantidadeItem").GetComponent<Text>();
		gmScript = gameManagerGO.GetComponent<GameManager>();
		esbarrou = false;
	}

	void Update()
	{
		if (Input.GetKey("e") && esbarrou == true)
		{
			gmScript.AddMunicao(quantidadeItemNum);
			gmScript.ItemProximoHUD.active = false;
			Destroy(gameObject);
		}
	}

	private void OnTriggerEnter(Collider collision)
	{
		if (collision.CompareTag("Player"))
		{
			esbarrou = true;
			gmScript.ItemProximoHUD.active = true;
			quantidadeItemText.text = quantidadeItemNum.ToString();
		}
	}

	private void OnTriggerExit(Collider collision)
	{
		if (collision.CompareTag("Player"))
		{
			esbarrou = false;
			gmScript.ItemProximoHUD.active = false;
		}
	}

	// Update is called once per frame
}
