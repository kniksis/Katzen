using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Missao : MonoBehaviour {

	int ObjetivoAtual;
	string[] Missoes;
	public Text TextoMissao;
	public GameObject FundoFala;
	float Distancia;
	public Vector3 Posicao;
	public GameObject[] PosicoesCopo;
	GameObject NPC;
	public GameObject BrejaPrefab;
	GameObject Bar;
	public bool BrejaCriado;
	GameObject gameManagerGO;
	GameManager gmScript;

	// Use this for initialization

	void Start () {
		gameManagerGO = GameObject.Find("Manager");
		gmScript = gameManagerGO.GetComponent<GameManager>();

		ObjetivoAtual = 0;
		NPC = GameObject.Find("Mux");
		Bar = GameObject.Find("PontoInicioMissaoBar");
		FundoFala = GameObject.Find("ImgFundoFala");

		Missoes = new string[4];

		Missoes[0] = "Fale com o Mux";
        Missoes[1] = "Va ao bar e traga uma breja nervosa para Mux";
        Missoes[2] = "Procure uma breja nervosa";
        Missoes[3] = "Volte e Entregue a breja ao Mux";

		BrejaPrefab = GameObject.Find("BrejaPrefab");
	}

	// Update is called once per frame
	void Update () {

		if (ObjetivoAtual < 4)
		{
			TextoMissao.text = Missoes[ObjetivoAtual];
		}

		if (ObjetivoAtual == 0)
		{
			Distancia = Mathf.FloorToInt(Vector3.Distance(NPC.transform.position, transform.position) / transform.lossyScale.magnitude);
			TextoMissao.text += " Dis: " + Distancia + "m";

			if (Distancia <= 3)
			{
				TextoMissao.text = "Aqui está quente para c*****! Me traga algo refrescante, muleque. [Se não quiser que eu te arraste pelas orelhas aperte ENTER]"+ Distancia;
				if (Input.GetKeyDown(KeyCode.Return))
				{
					ObjetivoAtual = 1;
				}
			}
		}

		if (ObjetivoAtual == 1)
		{

			Distancia = Mathf.FloorToInt(Vector3.Distance(Bar.transform.position, transform.position) / transform.lossyScale.magnitude);
			TextoMissao.text += " Dis: " + Distancia + "m";
			if (Distancia <= 3)
			{
				ObjetivoAtual = 2;
				BrejaCriado = false;
			}
		}

		if (ObjetivoAtual == 2)
		{
			if (!BrejaCriado)
			{
				if (Random.value < 0.5)
				{
					Posicao = GameObject.Find("P1").transform.position;
				}
				else
				{
					Posicao = GameObject.Find("P2").transform.position;
				}
				BrejaPrefab = Instantiate(BrejaPrefab, Posicao, BrejaPrefab.transform.rotation);
				BrejaCriado = true;
			}

			else
			{
				Distancia = Mathf.FloorToInt(Vector3.Distance(BrejaPrefab.transform.position, transform.position) / transform.lossyScale.magnitude);
				TextoMissao.text += " Dis: " + Distancia + "m";
				if (Distancia <= 1)
				{
					TextoMissao.text = "Vai ter que apertar ENTER para pegar esse copo, garoto.";
					if (Input.GetKeyDown(KeyCode.Return))
					{
						ObjetivoAtual = 3;
						Destroy(BrejaPrefab);
					}
				}
			}
		}

		if (ObjetivoAtual == 3)
		{
			Distancia = Mathf.FloorToInt(Vector3.Distance(NPC.transform.position, transform.position) / transform.lossyScale.magnitude);
			TextoMissao.text += " Dis: " + Distancia + "m";

			if (Distancia <= 3)
			{
				TextoMissao.text = "Não fez mais do que o seu trabalho. Tome aqui esses trocados, orelhudo.[para aceitar aperte enter]";
				if (Input.GetKeyDown(KeyCode.Return))
				{
					ObjetivoAtual = 4;
					TextoMissao.text = "";
					FundoFala.SetActive(false);
					gmScript.AddMoney(6);
					Destroy(GetComponent<Missao>());
				}
			}
		}
	}
}
