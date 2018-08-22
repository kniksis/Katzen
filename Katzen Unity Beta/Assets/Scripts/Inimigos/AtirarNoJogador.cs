using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AtirarNoJogador : MonoBehaviour {
	
	[SerializeField]
	GameObject jogEntrouMiraGO;
	[SerializeField]
	JogEntrouMira jemScript;

	static public AtirarNoJogador Instancia;

	public float fireRate = 0.5f;
	public float nextFire = 0.0f;
	public Transform respawnTiro;

	public GameObject tiroInimigoPrefab;
	public int Quantidade;
	List<GameObject> ListaObjetos;

	public bool atirar;


	// Use this for initialization
	void Awake()
	{
		jogEntrouMiraGO = GameObject.Find("MiraInimigo");
		jemScript = jogEntrouMiraGO.GetComponent<JogEntrouMira>();

		atirar = false;

		Instancia = this;
		ListaObjetos = new List<GameObject>();
		for (int i = 0; i < Quantidade; i++)
		{
			GameObject temp = (GameObject)GameObject.Instantiate(tiroInimigoPrefab);
			temp.SetActive(false);
			temp.name = tiroInimigoPrefab.name + "_" + i.ToString("000");
			ListaObjetos.Add(temp);
		}
	}

	void Start () {
	}

	public GameObject ObterObjeto()
	{
		GameObject retorno = null;
		for (int i = 0; i < ListaObjetos.Count; i++)
		{
			if (ListaObjetos[i].activeInHierarchy == false)
			{
				retorno = ListaObjetos[i];
				break;
			}
		}
		return retorno;
	}

	// Update is called once per frame
	void Update () {
		//atirar = false;
		if (jemScript.jogEntrou == true)
		{
			atirar = false;
			if (Time.time > nextFire)
			{
				nextFire = Time.time + fireRate;
				atirar = true;
			}
		}
	}
}
