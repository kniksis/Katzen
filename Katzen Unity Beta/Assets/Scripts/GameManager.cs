using System;
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
    public Animator animJog;

	[SerializeField]
	public float life;

    [SerializeField]
    public float estamina;

    [SerializeField]
	public int municao;

    [SerializeField]
    Slider lifeslider;

    [SerializeField]
    Slider estaminaslider;


    [SerializeField]
	Text municaonumber;

	[SerializeField]
	GameObject playerPrefab;

	[SerializeField]
	public GameObject respawnPoit;

	public GameObject playerInstance;
	
	public bool playerVivo;

	// Use this for initialization
	void Awake ()
	{
		SetLife();
        SetEstamina();
		SetMunicao();

		if (instance != null)
		{
			Debug.LogError("Existe mais de um manager na cena!");
		}

		instance = this;

		//cria o jogador na cena e guarda a ereferencia
		playerVivo = false;

		InstanciarJogador();
	}

    private void SetEstamina()
    {
        if(estamina <= 0)
        {
            DecreaseLife(0.1f);
        }
    }

    // Update is called once per frame
    void Update ()
    {
        //Cursor.lockState = CursorLockMode.None;
        //Cursor.lockState = CursorLockMode.Locked;

        lifeslider.value = life;
        estaminaslider.value = estamina;
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
		if (life <= 0)
		{
            animJog.Play("Morte1");
		}
	}

	public void AddLife(float LifeDesejada)
	{
		life += LifeDesejada;
		SetLife();
	}

	public void DecreaseLife(float LifeDesejada)
	{
		life -= LifeDesejada;
		SetLife();
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
