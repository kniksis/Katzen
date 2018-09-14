using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class NPCMux : MonoBehaviour {

	Missao AuxMissao;
	public Vector3 DisHeroi;
	public Text Fala;
	bool DesativaMissao;
	public GameObject FundoFala;
	public GameObject Player;

	// Use this for initialization
	void Start () {
		DesativaMissao = false;
		Player = GameObject.Find("Katzen");
		FundoFala.SetActive(false);
	}
	
	// Update is called once per frame
	void Update () {
		if (!DesativaMissao)
		{
			DisHeroi = Player.transform.position;

			DisHeroi = DisHeroi - transform.position;
			Fala.text = "";
			FundoFala.SetActive(false);

			if (DisHeroi.magnitude < 2)
			{
				FundoFala.SetActive(true);
				Fala.text = "Aperte Enter para aceitar a missão";

				if (Input.GetKeyDown(KeyCode.Return))
				{
					AuxMissao = Player.AddComponent<Missao>();
					AuxMissao.TextoMissao = Fala;
					DesativaMissao = true;
				}
			}
		}
	}
}
