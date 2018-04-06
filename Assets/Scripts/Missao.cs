using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Missao : MonoBehaviour {

	int ObjetivoAtual;
	string[] Missoes;
	public GUIText TextoMissao;
	float Distancia;
	public Vector3 Posicao;
	GameObject CopoDagua;
	public bool CopoDaguaCriado;

	// Use this for initialization
	void Start () {
        ObjetivoAtual = 0;

        Missoes = new string[4];

        Missoes[0] = "Fale com o Mux";
        Missoes[1] = "Va ao bar e traga uma bebida refrescante para Mux";
        Missoes[2] = "Procure uma bebida refrescante";
        Missoes[3] = "Volte e Entregue a bebida ao Mux";
    }

    // Update is called once per frame
    void Update () {

	//	if (ObjetivoAtual < 4)
	//	{
	//		TextoMissao.text = Missoes[ObjetivoAtual];
	//	}

	//	if (ObjetivoAtual == 0)
	//	{
	//		Distancia = Mathf.FloorToInt(Vector3.Distance(GameObject.Find("Mestre").transform.position, transform.position) / transform.lossyScale.magnitude);
	//		TextoMissao.text += " Dis: " + Distancia + "m";

	//		if (Distancia <= 3)
	//		{
	//			TextoMissao.text = "Aqui está quente para c*****! Me traga algo refrescante, muleque. [Se não quiser tomar um cascudo aperte ENTER]";
	//			if (Input.GetKeyDown(KeyCode.Return))
	//			{
	//				ObjetivoAtual = 1;
	//			}
	//		}
	//	}

	//	if (ObjetivoAtual == 1)
	//	{

	//		Distancia = Mathf.FloorToInt(Vector3.Distance(GameObject.Find("PontoInicioMissaoTemplo").transform.position, transform.position) / transform.lossyScale.magnitude);
	//		TextoMissao.text += " Dis: " + Distancia + "m";
	//		if (Distancia <= 3)
	//		{
	//			ObjetivoAtual = 2;
	//			VasoCriado = false;
	//		}
	//	}

	//	if (ObjetivoAtual == 2)
	//	{
	//		if (!VasoCriado)
	//		{
	//			VasoCriado = true;
	//			VasoOuro = GameObject.Find("VasoAjuda");
	//			if (Random.value < 0.5)
	//			{
	//				Posicao = GameObject.Find("P1").transform.position;
	//			}
	//			else
	//			{
	//				Posicao = GameObject.Find("P2").transform.position;
	//			}
	//			VasoOuro = Instantiate(VasoOuro, Posicao, VasoOuro.transform.rotation);
	//		}
	//		else
	//		{
	//			Distancia = Mathf.FloorToInt(Vector3.Distance(VasoOuro.transform.position, transform.position) / transform.lossyScale.magnitude);
	//			TextoMissao.text += " Dis: " + Distancia + "m";
	//			if (Distancia <= 1)
	//			{
	//				TextoMissao.text = "Vai ter que apertar ENTER para pegar esse copo, garoto.";
	//				if (Input.GetKeyDown(KeyCode.Return))
	//				{
	//					ObjetivoAtual = 3;
	//					Destroy(VasoOuro);
	//				}
	//			}
	//		}
	//	}

	//	if (ObjetivoAtual == 3)
	//	{
	//		Distancia = Mathf.FloorToInt(Vector3.Distance(GameObject.Find("Mestre").transform.position, transform.position) / transform.lossyScale.magnitude);
	//		TextoMissao.text += " Dis: " + Distancia + "m";

	//		if (Distancia <= 3)
	//		{
	//			TextoMissao.text = "Não fez mais do que o seu trabalho. Tome aqui esses trocados, orelhudo.[para aceitar aperte enter]";
	//			if (Input.GetKeyDown(KeyCode.Return))
	//			{
	//				ObjetivoAtual = 4;
	//				TextoMissao.text = "";
	//				Destroy(gameObject.GetComponent(Missao));
	//			}
	//		}
	//	}
	}
}
