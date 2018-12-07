using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using UnityEngine.Video;

public class ConversaKniksis04 : MonoBehaviour {

    public Animator animSetaP1;
    public Animator animSetaP2;
    public Animator animPainelFala;
    public Animator animDesenhosGrandes;
    public Animator animEscurecerTela;
    
    public GameObject painelBlur;

    public GameObject videoGO;
    public VideoPlayer video;

    public Button mao;
    
    public TextAsset textFile;

    public Text textoFala;
    public string[] falas;
    int falaAtual;
    int animAtual;
    public bool PodeAvancarFala;
    public bool VideoTocou;

    [SerializeField]
    public enum Fala
    {
        FalaKatzen = 0,
        FalaKaokaoa = 1
    }

    public Fala fala = Fala.FalaKatzen;

    public GameObject loadingScreen;
    public Slider slider;
    public Text progressText;
    public string ProximaFaseNome;
    public bool irParaProximaCena;
    public float tempoProxCena = 10.0f;
    public float tempOcultarHud = 10.0f;

    public GameObject PainelFundo;
    public GameObject PainelDesenhosGrandes;
    public GameObject PainelFalas;
    public GameObject PainelSetas;

    public AudioClip SomAreia;
    public AudioClip botaoAvancarSom;
    public AudioSource menuSomFonte;

    public GameObject musicaFundoGO;
    public AudioSource musicaFundo;

    // Use this for initialization
    void Start () {
        video = videoGO.GetComponent<VideoPlayer>();
        musicaFundo = musicaFundoGO.GetComponent<AudioSource>();
        menuSomFonte = GetComponent<AudioSource>();
        video.Pause();
        VideoTocou = false;
        PodeAvancarFala = false;
        textFile = Resources.Load<TextAsset>("Falas/Cena04_Kniksis_Katzen");
        string[] linhasArquivo = textFile.text.Split('\n'); // quebra por linhaso arquivo e atribui a uma lista de strings
        falas = new string[linhasArquivo.Length];
        int contadorFala = 0;

        painelBlur.SetActive(false);
        animSetaP1.SetBool("aparecer", false);
        animSetaP2.SetBool("aparecer", false);
        foreach (string linha in linhasArquivo)
        {
            string[] valoresLinha = linha.Split('\t'); // quebra o caracte de TAB entre a numeração e o texto;
            // valoresLinha[0] // valor do indice da fala
            // valoresLinha[1] // conteúdo/texto da fala
            // int indiceFala = int.Parse(valoresLinha[0]);
            falas[contadorFala] = valoresLinha[1];
            contadorFala = contadorFala + 1;
        }
        falaAtual = -1;
        animAtual = -1;
        textoFala.text = falas[0];
    }
	
	// Update is called once per frame
	void Update () {
        //if (Input.GetButton("Atirar") && falaAtual < 0)
        //{
        //    avancarFala();
        //}

        if (irParaProximaCena)
        {
            tempoProxCena -= Time.deltaTime;
            if (tempoProxCena <= 0.0f)
            {
                LoadLevel(ProximaFaseNome);
                falaAtual = 0;
                irParaProximaCena = false;
            }
        }

        if (VideoTocou)
        {
            tempOcultarHud -= Time.deltaTime;
            if(tempOcultarHud <= 0.0f)
            {
                PainelFundo.SetActive(false);
                PainelDesenhosGrandes.SetActive(false);
                PainelFalas.SetActive(false);
                PainelSetas.SetActive(false);
                VideoTocou = false;
            }
        }
    }

    public void avancarFala()
    {
        //Avanca as falas
        menuSomFonte.clip = botaoAvancarSom;
        menuSomFonte.Play();
        if (PodeAvancarFala)
        {
            falaAtual++;
            Debug.Log("Fala Atual: " + falaAtual);

            if (falaAtual > 0 && falaAtual < falas.Length)
                textoFala.text = falas[falaAtual];

            if(falaAtual == 0)
            {
                animPainelFala.SetBool("abrirFalas", true);
                animSetaP1.SetBool("aparecer", true);
            }
            if (falaAtual == 1)
            {

            }
            if (falaAtual == 2)
            {

            }

            if (falaAtual == 3)
            {
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", true);
            }
            if(falaAtual == 4)
            {
                PodeAvancarFala = false;
            }
            if(falaAtual == 5)
            {
                animPainelFala.SetBool("abrirFalas", true);
                animSetaP1.SetBool("aparecer", true);
            }
            if(falaAtual == 9)
            {
                animDesenhosGrandes.SetTrigger("AvancarEstado");
            }
            if(falaAtual == 11)
            {
                video.Play();
                VideoTocou = true;
                musicaFundo.Pause();
                irParaProximaCena = true;
            }
        }

        //Avanca as animacoes
        if (!PodeAvancarFala)
        {
            animAtual++;
            Debug.Log("Animacao Atual:" + animAtual);
            if (animAtual == 0)
            {
                painelBlur.SetActive(false);
                animPainelFala.SetBool("abrirFalas", false);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", false);
                animDesenhosGrandes.SetTrigger("AvancarEstado");
            }

            if(animAtual == 1)
            {
                animDesenhosGrandes.SetTrigger("AvancarEstado");
                PodeAvancarFala = true;
                menuSomFonte.clip = SomAreia;
                menuSomFonte.Play();
            }
            if(animAtual == 2)
            {
                animPainelFala.SetBool("abrirFalas", false);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", false);
                animDesenhosGrandes.SetTrigger("AvancarEstado");
                PodeAvancarFala = true;
            }
        }
    }

    public void trocarFala()
    {
        if (fala == Fala.FalaKatzen)
        {
            animPainelFala.Play("TrocarFala");
            animSetaP1.SetBool("aparecer", false);
            animSetaP2.SetBool("aparecer", true);
            fala = Fala.FalaKatzen;
        }

        else
        {
            animPainelFala.Play("TrocarFala");
            animSetaP1.SetBool("aparecer", true);
            animSetaP2.SetBool("aparecer", false);
            fala = Fala.FalaKatzen;
        }
    }

    public void LoadLevel(string sceneNome)
    {
        StartCoroutine(LoadAsynchronously(sceneNome));
    }

    private IEnumerator LoadAsynchronously(string sceneNome)
    {
        AsyncOperation operation = SceneManager.LoadSceneAsync(sceneNome);
        loadingScreen.SetActive(true);

        while (!operation.isDone)
        {
            float progress = Mathf.Clamp01(operation.progress / .9f);
            slider.value = progress;
            progressText.text = progress * 100 + "%";
            yield return null;
        }
    }
}
