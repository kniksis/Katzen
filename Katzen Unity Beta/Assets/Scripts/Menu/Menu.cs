using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Menu : MonoBehaviour {

	public void CarregarNivel1()
	{
		SceneManager.LoadScene("NivelBeta");
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
