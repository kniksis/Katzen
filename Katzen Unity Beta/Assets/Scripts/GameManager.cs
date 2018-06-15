using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class GameManager : MonoBehaviour
{

	private static GameManager instance;

	public static GameManager Instance
	{
		get
		{
			if (instance == null)
			{
				Debug.LogError("O manager nao esta na cena");
			}
			return instance;
		}
	}

	[SerializeField]
	public int life;
	[SerializeField]
	public int municao;
	[SerializeField]
	public int money;

	[SerializeField]
	Text lifenumber;

	[SerializeField]
	Text moneynumber;

	[SerializeField]
	Text municaonumber;

	[SerializeField]
	GameObject playerPrefab;

	[SerializeField]
	public GameObject respawnPoit;

	[SerializeField]
	public GameObject InventarioHUD;

	[SerializeField]
	public GameObject ItemProximoHUD;

	public GameObject playerInstance;
	
	public bool playerVivo;

	// Use this for initialization
	void Awake ()
	{
		SetLife();
		SetMoney();
		SetMunicao();

		InventarioHUD.active = false;
		ItemProximoHUD.active = false;

		if (instance != null)
		{
			Debug.LogError("Existe mais de um manager na cena!");
		}

		instance = this;

		//cria o jogador na cena e guarda a ereferencia
		playerVivo = false;

		InstanciarJogador();
	}
	
	// Update is called once per frame
	void Update ()
	{
		if (Input.GetKeyDown("i") && InventarioHUD.active == false)
		{
			InventarioHUD.active = true;
			Cursor.lockState = CursorLockMode.None;
		}
		else if (Input.GetKeyDown("i") && InventarioHUD.active == true)
		{
			InventarioHUD.active = false;
			Cursor.lockState = CursorLockMode.Locked;
		}

		if (Input.GetButton("Fire1")  && Cursor.lockState == CursorLockMode.None && InventarioHUD.active == false)
		{
			Cursor.lockState = CursorLockMode.Locked;
		}
	}

	private void InstanciarJogador()
	{
		/*
		playerInstance = Instantiate(playerPrefab, respawnPoit.transform.position, respawnPoit.transform.rotation);
		//busca a camera padrão do jogo e adiciona a referencia
		MyCamera mycamera = Camera.main.GetComponent<MyCamera>();
		mycamera.SetTarget(shipInstance);
		playerVivo = true;*/
	}

	public void SetLife()
	{
		lifenumber.text = life.ToString();
		if (life <= 0)
		{
			SceneManager.LoadScene("GameOver");
		}
	}

	public void AddLife(int LifeDesejada)
	{
		life += LifeDesejada;
		SetLife();
	}

	public void DecreaseLife(int LifeDesejada)
	{
		life -= LifeDesejada;
		SetLife();
	}


	public void SetMoney()
	{
		moneynumber.text = money.ToString();
	}

	public void AddMoney(int MoneyDesejada)
	{
		money += MoneyDesejada;
		SetMoney();
	}

	public void DecreaseMoney(int MoneyDesejada)
	{
		money -= MoneyDesejada;
		SetMoney();
	}
	
	public void SetMunicao()
	{
		municaonumber.text = municao.ToString();
	}

	public void DecreaseMunicao()
	{
		municao--;
		SetMunicao();
	}

	public void AddMunicao(int MunicaoDesejada)
	{
		municao += MunicaoDesejada;
		SetMunicao();
	}
}
