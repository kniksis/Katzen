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
    float tempoRestartCenaAtual = 10.0f;

    [SerializeField]
    string cenaAtual;

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
    bool ReiniciarCena;

    // Use this for initialization
    void Awake ()
	{
		SetLife();
        SetEstamina();
		SetMunicao();
        ReiniciarCena = false;

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
        //Cursor.lockState = CursorLockMode.None;
        //Cursor.lockState = CursorLockMode.Locked;

        lifeslider.value = life;
        estaminaslider.value = estamina;
        if(ReiniciarCena)
        {
            RecarregarCena();
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
		if (life <= 0)
		{
            animJog.SetTrigger("Morrer");
            ReiniciarCena = true;
        }
	}

    private void RecarregarCena()
    {
        tempoRestartCenaAtual -= Time.deltaTime;
        if (tempoRestartCenaAtual <= 0.0f)
        {
            Application.LoadLevel(cenaAtual);
        }
    }

    public void AddLife(float LifeDesejada)
	{
		life += LifeDesejada;
		SetLife();
	}

	public void DecreaseLife(float LifeDesejada)
	{
        if (life >= 0)
        {
            life -= LifeDesejada;
            SetLife();
        }

        if(life <= 0)
        {
            life = 0;
            SetLife();
        }
	}
    
    public void SetEstamina()
    {
        if (estamina <= 0)
        {
            estamina = 0;
        }
    }

    public void AddEstamina(float EstaminaDesejada)
    {
        if (estamina <= 100)
        {
            estamina += EstaminaDesejada;
            SetEstamina();
        }

        if(estamina >= 100)
        {
            estamina = 100;
            SetEstamina();
        }
    }

    public void DecreaseEstamina(float EstaminaDesejada)
    {
        if (estamina >= 0)
        {
            estamina -= EstaminaDesejada;
            SetEstamina();
        }

        if (estamina <= 0)
        {
            estamina = 0;
            SetEstamina();
        }
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
