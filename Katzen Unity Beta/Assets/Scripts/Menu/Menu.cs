using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Menu : MonoBehaviour {

    [SerializeField]
    string Nivel1;

	public void CarregarNivel1()
	{
		//SceneManager.LoadScene(Nivel1);
	}

	public void CarregarMenu()
	{
		SceneManager.LoadScene("Menu");
	}

	public void Sair()
    {
		Debug.Log("QUIT!");
		Application.Quit();
	}
}
