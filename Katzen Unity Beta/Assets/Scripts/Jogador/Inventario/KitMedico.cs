using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class KitMedico : MonoBehaviour {

	GameObject gameManagerGO;
	GameManager gmScript;
	[SerializeField]
	public Text quantidadeItemText;
	[SerializeField]
	public int quantidadeItemNum;
	bool esbarrou;
	public Image spriteRender;
	[SerializeField]
	Sprite sprites;
	[SerializeField]
	public GameObject PFItem;
	[SerializeField]
	GameObject inventarioGO;
	[SerializeField]
	Inventario invScript;


	// Use this for initialization
	void Awake()
	{
		inventarioGO = GameObject.Find("Canvas/Scroll View Inventario/Viewport");
		invScript = inventarioGO.GetComponent<Inventario>();

		gameManagerGO = GameObject.Find("Manager");
		gmScript = gameManagerGO.GetComponent<GameManager>();
		quantidadeItemText = GameObject.Find("Canvas/ImgItemProximo/ImgFundoItem/TextQuantidadeItem").GetComponent<Text>();
		
		spriteRender = GameObject.Find("Canvas/ImgItemProximo/ImgFundoItem/ImgItem").GetComponent<Image>();
		esbarrou = false;
	}

	void Update()
	{
		if (Input.GetKey("e") && esbarrou == true)
		{
			gmScript.AddLife(quantidadeItemNum);
			//gmScript.ItemProximoHUD.active = false;
			invScript.AddItem(PFItem, quantidadeItemNum);
			Destroy(gameObject);
		}
	}

	private void OnTriggerEnter(Collider collision)
	{
		if (collision.CompareTag("Player"))
		{
			esbarrou = true;
			//gmScript.ItemProximoHUD.active = true;
			spriteRender.sprite = sprites;
			quantidadeItemText.text = quantidadeItemNum.ToString();
		}
	}

	private void OnTriggerExit(Collider collision)
	{
		if (collision.CompareTag("Player"))
		{
			esbarrou = false;
			//gmScript.ItemProximoHUD.active = false;
		}
	}

	// Update is called once per frame
}
