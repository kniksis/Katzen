using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Item : MonoBehaviour {
	public int Id, IndiceInv;
	public string Nome;
	public Sprite Pprites;
	public GameObject Objeto;
	public int Qnt_max, Qnt_atual;
	public bool Destruivel;

	void NomeItem()
	{
		transform.GetChild(0).GetComponent<Text>().text = Nome;
	}

	void QntItem()
	{
		transform.GetChild(0).GetChild(0).GetComponent<Text>().text = "x" + Qnt_atual;
	}

	void TrocaItem()
	{
		Player._inventarioPlayer.TrocaItem(IndiceInv);
	}
	// Use this for initialization
	void Start () {

		Button aux_ = GetComponent<Button>();
		aux_.onClick.AddListener(TrocaItem);
		
		NomeItem();
		QntItem();
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
