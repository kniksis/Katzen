using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameObjectPool : MonoBehaviour {

    static public GameObjectPool Instancia;
    public GameObject Prefab;
    public int Quantidade;
    List<GameObject> ListaObjetos;

	// Use this for initialization
	void Awake () {
        Instancia = this;
        ListaObjetos = new List<GameObject>();
        for(int i = 0; i < Quantidade; i++)
        {
            GameObject temp = (GameObject)GameObject.Instantiate(Prefab);
            temp.SetActive(false);
            temp.name = Prefab.name + "_" + i.ToString("000");
            ListaObjetos.Add(temp);
        }
	}

    public GameObject ObterObjeto()
    {
        GameObject retorno = null;
        for(int i = 0; i < ListaObjetos.Count; i++)
        {
            if(ListaObjetos[i].activeInHierarchy==false)
            {
                retorno = ListaObjetos[i];
                break;
            }
        }
        return retorno;
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
