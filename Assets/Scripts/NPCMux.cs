using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class NPCMux : MonoBehaviour {

	Missao AuxMissao;
	public Vector3 DisHeroi;
	public GUIText Fala;
	bool DesativaMissao;

	// Use this for initialization
	void Start () {
		DesativaMissao = false;
	}
	
	// Update is called once per frame
	void Update () {
		if (!DesativaMissao)
		{
			DisHeroi = GameObject.Find("Katzen").transform.position;

			DisHeroi = DisHeroi - transform.position;
			Fala.text = "";
			if (DisHeroi.magnitude < 2)
			{
				Fala.text = "Aperte Enter para aceitar a missão";

				if (Input.GetKeyDown(KeyCode.Return))
				{
					AuxMissao = GameObject.Find("Katzen").AddComponent<Missao>();
					AuxMissao.TextoMissao = Fala;
					DesativaMissao = true;
				}
			}
		}
	}
}
