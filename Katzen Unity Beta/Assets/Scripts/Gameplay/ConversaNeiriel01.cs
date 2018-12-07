using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;
using UnityEngine.SceneManagement;
using UnityEngine.Video;

public class ConversaNeiriel01 : MonoBehaviour {

    public Animator animSetaP1;
    public Animator animSetaP2;
    public Animator animPainelP1;
    public Animator animPainelP2;
    public Animator animPainelFala;
    public Animator animTelaPreta;
    public Animator animFundo;
    public Animator animAceiRecu;
    public Animator animEscurecerTela;

    public GameObject painelPreto;
    public GameObject painelBlur;
    public GameObject videoGO;
    public VideoPlayer video;
    public bool VideoTocou;
    
    public GameObject PainelFundo;
    public GameObject PainelPersonagens;
    public GameObject PainelEscurecer;
    public GameObject PainelAceiRecu;
    public GameObject PainelFalas;
    public GameObject PainelSetas;
    public GameObject PainelPreto;

    public Button mao;

    public Image imagemExpressaoP1;
    public Image imagemExpressaoP2;

    public Sprite[] expressoesP1;
    public Sprite[] expressoesP2;
    
    public TextAsset textFile;

    public Text textoFala;
    public Text textoFalasTelaPreta;
    public string[] falas;
    int falaAtual;

    [SerializeField]
    public enum Fala
    {
        FalaNeiriel = 0,
        FalaKatzen = 1
    }

    public Fala fala = Fala.FalaNeiriel;

    public GameObject loadingScreen;
    public Slider slider;
    public Text progressText;
    public string ProximaFaseNome;
    public string NivelFinal;
    public bool irParaProximaCenaFinal;
    public bool irParaProximaCenaNormal;
    public float tempoProxCenaFinal = 10.0f;
    public float tempoProxCena = 4.0f;
    public float tempOcultarHud = 10.0f;
    
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
        textFile = Resources.Load<TextAsset>("Falas/Cena01_Neiriel_Katzen");
        string[] linhasArquivo = textFile.text.Split('\n'); // quebra por linhaso arquivo e atribui a uma lista de strings
        falas = new string[linhasArquivo.Length];
        int contadorFala = 0;

        irParaProximaCenaNormal = false;

        painelBlur.SetActive(false);
        animPainelP1.SetBool("foco", true);
        animPainelP2.SetBool("foco", false);
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
        textoFala.text = falas[0];
        textoFalasTelaPreta.text = falas[0];
    }
	
	// Update is called once per frame
	void Update () {
        if (Input.GetButtonUp("Atirar") && falaAtual <= 3)
        {
            avancarFala();
        }

        if (irParaProximaCenaFinal)
        {
            tempoProxCenaFinal -= Time.deltaTime;
            if (tempoProxCenaFinal <= 0.0f)
            {
                LoadLevel(NivelFinal);
                falaAtual = 0;
                irParaProximaCenaFinal = false;
            }
        }

        if (VideoTocou)
        {
            tempOcultarHud -= Time.deltaTime;
            if (tempOcultarHud <= 0.0f)
            {
                PainelFundo.SetActive(false);
                PainelEscurecer.SetActive(false);
                PainelFalas.SetActive(false);
                PainelSetas.SetActive(false);
                PainelPersonagens.SetActive(false);
                PainelAceiRecu.SetActive(false);
                PainelPreto.SetActive(false);
                VideoTocou = false;
            }
        }

        if (irParaProximaCenaNormal)
        {
            tempoProxCena -= Time.deltaTime;
            if (tempoProxCena <= 0.0f)
            {
                LoadLevel(ProximaFaseNome);
                irParaProximaCenaNormal = false;
            }
        }
    }
    bool corrigiCinco = false;

    public void avancarFala()
    {
        menuSomFonte.clip = botaoAvancarSom;
        menuSomFonte.Play();
        Debug.Log(falaAtual);
        falaAtual += 1;
        if (falaAtual == 52)
        {
            animSetaP1.SetBool("aparecer", false);
            animSetaP2.SetBool("aparecer", false);
            animPainelP1.Play("FecharPainelP1");
            animPainelP2.Play("FecharPainelP2");
            animPainelFala.SetBool("abrirFalas", false);
            textoFala.text = "";
            animEscurecerTela.SetTrigger("Escurecer");
            painelBlur.SetActive(false);
        }
        else
        {
            textoFala.text = falas[falaAtual];
            textoFalasTelaPreta.text = falas[falaAtual];
        }

        if (falaAtual == 3)
        {
            animTelaPreta.SetTrigger("DeixarClaro");
            animFundo.SetTrigger("TrocarCena");
        }

        if (falaAtual == 4 && corrigiCinco == false)
        {
            animFundo.SetTrigger("TrocarCena");
            painelPreto.SetActive(false);
            falaAtual = 3;
            corrigiCinco = true;
        }

        if (falaAtual == 3 && corrigiCinco == true)
        {
            painelBlur.SetActive(true);
            animPainelFala.SetBool("abrirFalas", true);
            animSetaP1.SetBool("aparecer", true);
            animSetaP2.SetBool("aparecer", false);
            animPainelP1.SetTrigger("AtivarPainelPersonagem");
            animPainelP1.SetBool("foco", true);
            animPainelP2.SetBool("foco", false);
            imagemExpressaoP1.sprite = expressoesP1[0];
            fala = Fala.FalaNeiriel;
        }

        if(falaAtual == 5 && corrigiCinco == true)
        {
            imagemExpressaoP1.sprite = expressoesP1[2];
            animPainelP1.SetTrigger("redarFoco");
            animPainelP2.SetTrigger("AtivarPainelPersonagem");
            animPainelP2.SetBool("foco", false);
            imagemExpressaoP2.sprite = expressoesP2[1];
        }

        if(falaAtual == 8)
        {
            imagemExpressaoP1.sprite = expressoesP1[1];
            animPainelP1.SetTrigger("redarFoco");
        }

        if(falaAtual == 9)
        {
            imagemExpressaoP2.sprite = expressoesP2[0];
            animPainelFala.Play("TrocarFala");
            animSetaP1.SetBool("aparecer", false);
            animSetaP2.SetBool("aparecer", true);
            animPainelP1.SetBool("foco", false);
            animPainelP2.SetBool("foco", true);
            fala = Fala.FalaKatzen;
        }

        if(falaAtual == 10)
        {
            animPainelFala.Play("TrocarFala");
            animSetaP1.SetBool("aparecer", true);
            animSetaP2.SetBool("aparecer", false);
            animPainelP1.SetBool("foco", true);
            animPainelP2.SetBool("foco", false);
            imagemExpressaoP1.sprite = expressoesP1[1];
            fala = Fala.FalaNeiriel;
        }

        if(falaAtual == 15)
        {
            animPainelP1.SetTrigger("redarFoco");
            imagemExpressaoP1.sprite = expressoesP1[0];
        }

        if(falaAtual == 16)
        {
            imagemExpressaoP2.sprite = expressoesP2[1];
        }

        if(falaAtual == 24)
        {
            imagemExpressaoP1.sprite = expressoesP1[3];
            animPainelP1.SetTrigger("redarFoco");
        }

        if(falaAtual == 26)
        {
            animPainelP1.SetTrigger("redarFoco");
            imagemExpressaoP1.sprite = expressoesP1[0];
        }

        if(falaAtual == 27)
        {
            animAceiRecu.SetBool("PainelAceiRecuAbrir", true);
            imagemExpressaoP2.sprite = expressoesP2[1];
            mao.interactable = false;
        }
        if(falaAtual == 30)
        {
            animSetaP1.SetBool("aparecer", false);
            animSetaP2.SetBool("aparecer", false);
            animPainelP1.Play("FecharPainelP1");
            animPainelP2.Play("FecharPainelP2");
            animPainelFala.SetBool("abrirFalas", false);
            textoFala.text = "";
            animEscurecerTela.SetTrigger("Escurecer");
            irParaProximaCenaNormal = true;
            painelBlur.SetActive(false);
        }

        if(falaAtual == 32)
        {
            animSetaP1.SetBool("aparecer", false);
            animSetaP2.SetBool("aparecer", false);
            animPainelP1.Play("FecharPainelP1");
            animPainelP2.Play("FecharPainelP2");
            animPainelFala.SetBool("abrirFalas", false);
            textoFala.text = "";
            animEscurecerTela.SetTrigger("Escurecer");
            irParaProximaCenaNormal = true;
            painelBlur.SetActive(false);
        }

        if (falaAtual == 33)
        {
            animPainelP1.SetTrigger("redarFoco");
            imagemExpressaoP1.sprite = expressoesP1[1];
            imagemExpressaoP2.sprite = expressoesP2[0];
        }

        if(falaAtual == 49)
        {
            animAceiRecu.SetBool("PainelAceiRecuAbrir", true);
            mao.interactable = false;
            imagemExpressaoP1.sprite = expressoesP1[0];
            imagemExpressaoP2.sprite = expressoesP2[1];
        }

        if(falaAtual == 52)
        {
            video.Play();
            VideoTocou = true;
            musicaFundo.Pause();
            irParaProximaCenaFinal = true;
        }
    }

    public void trocarFala()
    {
        if (fala == Fala.FalaNeiriel)
        {
            animPainelFala.Play("TrocarFala");
            animSetaP1.SetBool("aparecer", false);
            animSetaP2.SetBool("aparecer", true);
            animPainelP1.SetBool("foco", false);
            animPainelP2.SetBool("foco", true);
            fala = Fala.FalaKatzen;
        }

        else
        {
            animPainelFala.Play("TrocarFala");
            animSetaP1.SetBool("aparecer", true);
            animSetaP2.SetBool("aparecer", false);
            animPainelP1.SetBool("foco", true);
            animPainelP2.SetBool("foco", false);
            fala = Fala.FalaNeiriel;
        }
    }

    public void aceitar()
    {
        if(falaAtual == 27)
        {
            falaAtual = 28;
            avancarFala();
            animAceiRecu.SetBool("PainelAceiRecuAbrir", false);
            imagemExpressaoP2.sprite = expressoesP2[2];
            mao.interactable = true;
        }

        if(falaAtual == 49)
        {
            falaAtual = 30;
            avancarFala();
            animAceiRecu.SetBool("PainelAceiRecuAbrir", false);
            imagemExpressaoP2.sprite = expressoesP2[2];
            mao.interactable = true;
        }
    }

    public void recusar()
    {
        if (falaAtual == 27)
        {
            falaAtual = 32;
            avancarFala();
            animAceiRecu.SetBool("PainelAceiRecuAbrir", false);
            mao.interactable = true;
        }

        if (falaAtual == 49)
        {
            falaAtual = 50;
            avancarFala();
            animAceiRecu.SetBool("PainelAceiRecuAbrir", false);
            imagemExpressaoP2.sprite = expressoesP2[0];
            mao.interactable = true;
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
