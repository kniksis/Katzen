using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Inventario : MonoBehaviour {

	public RectTransform content;
	[SerializeField]
	List <GameObject> itens;
	public int indice1 = -1, indice2 = -1;

	public bool JuntaItens(Item item1, Item item2)
	{
		if(item1.Id!= item2.Id)
		{
			return false;
		}
		else
		{
			item1.Qnt_atual = item1.Qnt_atual + item2.Qnt_atual;
			if(item1.Qnt_atual>item1.Qnt_max)
			{
				item2.Qnt_atual = item1.Qnt_atual - item1.Qnt_max;
				item1.Qnt_atual = item1.Qnt_max;
			}
			else
			{
				item2.Qnt_atual = 0;
				return true;
			}
		}
		return false;
	}

	public void AddItem(GameObject item, int quantia)
	{
		/*for (int i = 0; i < itens.Count; i++)
		{
			JuntaItens(itens[i].GetComponent<Item>(),item.GetComponent<Item>());
			if (item.GetComponent<Item>().Qnt_atual == 0)
			{
				DesenhaItems();
				return;
			}
		}*/

		itens.Add(item);
		item.GetComponent<Item>().IndiceInv = itens.Count - 1;
		item.GetComponent<Item>().Qnt_atual = quantia;
		DesenhaItems();
	}

	public void TrocaItem(int indice)
	{
		if(indice1==-1)
		{
			indice1 = indice;
		}

		else
		{
			indice2 = indice;
			GameObject aux_ = itens[indice1];
				itens[indice1] = itens[indice2];
				itens[indice2] = aux_;

				itens[indice1].GetComponent<Item>().IndiceInv = indice1;
				itens[indice2].GetComponent<Item>().IndiceInv = indice2;

				indice1 = -1;
				indice2 = -1;
				DesenhaItems();
			/*if (JuntaItens(itens[indice2].GetComponent<Item>(), itens[indice1].GetComponent<Item>()))
			{
				
			}*/
		}
	}

	void DesenhaItems()
	{
		while (content.childCount > 0)
		{
			Transform filho = content.GetChild(0);
			filho.parent = null;
			Destroy(filho.gameObject);
		}

		for (int i = 0; i < itens.Count; i++)
		{
			GameObject item = Instantiate(itens[content.childCount], content.position, Quaternion.identity) as GameObject;
			item.transform.parent = content.transform;
		}
	}

	// Use this for initialization
	void Start () {
		DesenhaItems();
	}
	
	// Update is called once per frame
	void Update () {
	}
}
