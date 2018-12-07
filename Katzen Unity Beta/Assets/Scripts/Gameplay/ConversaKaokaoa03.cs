using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;
using UnityEngine.SceneManagement;
using UnityEngine.UI;

public class ConversaKaokaoa03 : MonoBehaviour {

    public Animator animSetaP1;
    public Animator animSetaP2;
    public Animator animPainelP1;
    public Animator animPainelP2;
    public Animator animPainelFala;
    public Animator animDesenhosGrandes;
    public Animator animEscurecerTela;
    public Animator animPainelBotoes;
    
    public GameObject painelBlur;

    public Button mao;

    public Image imagemExpressaoP1;
    public Image imagemExpressaoP2;

    public Sprite[] expressoesP1;
    public Sprite[] expressoesP2;
    
    public TextAsset textFile;

    public Text textoFala;
    public string[] falas;
    int falaAtual;
    int animAtual;
    public bool PodeAvancarFala;
    public bool Pacifico;

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
    public float tempoProxCena = 10.0f;

    public AudioClip botaoAvancarSom;
    public AudioSource menuSomFonte;
    // Use this for initialization
    void Start ()
    {
        Cursor.lockState = CursorLockMode.None;
        PodeAvancarFala = true;
        textFile = Resources.Load<TextAsset>("Falas/Cena03_Katzen_e_Kaokaoa");
        string[] linhasArquivo = textFile.text.Split('\n'); // quebra por linhaso arquivo e atribui a uma lista de strings
        falas = new string[linhasArquivo.Length];
        int contadorFala = 0;

        painelBlur.SetActive(false);
        animPainelP1.SetBool("foco", true);
        animPainelP2.SetBool("foco", false);
        animSetaP1.SetBool("aparecer", false);
        animSetaP2.SetBool("aparecer", false);
        animPainelBotoes.SetBool("PainelAceiRecuAbrir", true);
        foreach (string linha in linhasArquivo)
        {
            string[] valoresLinha = linha.Split('\t'); // quebra o caracte de TAB entre a numeração e o texto;
            // valoresLinha[0] // valor do indice da fala
            // valoresLinha[1] // conteúdo/texto da fala
            // int indiceFala = int.Parse(valoresLinha[0]);
            falas[contadorFala] = valoresLinha[1];
            contadorFala = contadorFala + 1;
        }
        falaAtual = -3;
        animAtual = -2;
        textoFala.text = falas[0];
    }
	
	// Update is called once per frame
	void Update () {
        //if (Input.GetButton("Atirar") && falaAtual == -1)
        //{
        //    avancarFala();
        //}

        if (Input.GetButtonDown("Pause"))
        {
            Cursor.lockState = CursorLockMode.None;
        }
        if (animAtual == 4)
        {
            tempoProxCena -= Time.deltaTime;
            if (tempoProxCena <= 0.0f)
            {
                LoadLevel(ProximaFaseNome);
                animAtual = 0;
            }
        }
    }

    public void avancarFala()
    {
        menuSomFonte.clip = botaoAvancarSom;
        menuSomFonte.Play();
        if (PodeAvancarFala)
        {
            falaAtual++;
            Debug.Log("Fala Atual: " + falaAtual);

            if (falaAtual > 0 && falaAtual < falas.Length)
                textoFala.text = falas[falaAtual];

            if (falaAtual == 0)
            {
                painelBlur.SetActive(true);
                animPainelFala.SetBool("abrirFalas", true);
                animSetaP1.SetBool("aparecer", true);
                animSetaP2.SetBool("aparecer", false);
                animPainelP1.SetTrigger("AtivarPainelPersonagem");
                animPainelP1.SetBool("foco", true);
                animPainelP2.SetTrigger("AtivarPainelPersonagem");
                animPainelP2.SetBool("foco", false);
                imagemExpressaoP1.sprite = expressoesP1[0];
                imagemExpressaoP2.sprite = expressoesP2[0];
                fala = Fala.FalaKatzen;
            }

            if (falaAtual == 1)
            {
                //FalaKaokaoa
                animPainelP1.SetBool("foco", false);
                animPainelP2.SetBool("foco", true);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", true);
            }

            if (falaAtual == 3)
            {
                //FalaKatzen
                animPainelP1.SetBool("foco", true);
                animPainelP2.SetBool("foco", false);
                animSetaP1.SetBool("aparecer", true);
                animSetaP2.SetBool("aparecer", false);
            }

            if (falaAtual == 4)
            {
                //FalaKaokaoa
                animPainelP1.SetBool("foco", false);
                animPainelP2.SetBool("foco", true);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", true);
            }

            if (falaAtual == 5)
            {
                //FalaKatzen
                animPainelP1.SetBool("foco", true);
                animPainelP2.SetBool("foco", false);
                animSetaP1.SetBool("aparecer", true);
                animSetaP2.SetBool("aparecer", false);
            }

            if (falaAtual == 6)
            {
                //FalaKaokaoa
                animPainelP1.SetBool("foco", false);
                animPainelP2.SetBool("foco", true);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", true);
            }

            if (falaAtual == 7)
            {
                //FalaKatzen
                animPainelP1.SetBool("foco", true);
                animPainelP2.SetBool("foco", false);
                animSetaP1.SetBool("aparecer", true);
                animSetaP2.SetBool("aparecer", false);
            }

            if (falaAtual == 9)
            {
                PodeAvancarFala = false;
            }

            if (falaAtual == 10)
            {
                //FalaKaokaoa
                animPainelP1.SetBool("foco", false);
                animPainelP2.SetBool("foco", true);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", true);
            }

            if (falaAtual == 13 && Pacifico == false)
            {
                textoFala.text = "";
                PodeAvancarFala = false;
            }

            if(falaAtual == 13 && Pacifico == true)
            {
                painelBlur.SetActive(true);
                animPainelFala.SetBool("abrirFalas", true);
                animSetaP1.SetBool("aparecer", true);
                animSetaP2.SetBool("aparecer", false);
                animPainelP1.SetTrigger("AtivarPainelPersonagem");
                animPainelP1.SetBool("foco", true);
                animPainelP2.SetTrigger("AtivarPainelPersonagem");
                animPainelP2.SetBool("foco", false);
                imagemExpressaoP1.sprite = expressoesP1[1];
                imagemExpressaoP2.sprite = expressoesP2[1];
                fala = Fala.FalaKatzen;
            }

            if (falaAtual == 15)
            {
                //FalaKaokaoa
                painelBlur.SetActive(true);
                animPainelP1.SetBool("foco", false);
                animPainelP2.SetBool("foco", true);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", true);
            }

            if (falaAtual == 17)
            {
                //FalaKatzen
                animPainelP1.SetBool("foco", true);
                animPainelP2.SetBool("foco", false);
                animSetaP1.SetBool("aparecer", true);
                animSetaP2.SetBool("aparecer", false);
            }

            if (falaAtual == 19)
            {
                //FalaKaokaoa
                animPainelP1.SetBool("foco", false);
                animPainelP2.SetBool("foco", true);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", true);
            }

            if (falaAtual == 20)
            {
                //FalaKatzen
                animPainelP1.SetBool("foco", true);
                animPainelP2.SetBool("foco", false);
                animSetaP1.SetBool("aparecer", true);
                animSetaP2.SetBool("aparecer", false);
            }

            if (falaAtual == 22)
            {
                //FalaKaokaoa
                animPainelP1.SetBool("foco", false);
                animPainelP2.SetBool("foco", true);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", true);
            }

            if (falaAtual == 23)
            {
                //FalaKatzen
                animPainelP1.SetBool("foco", true);
                animPainelP2.SetBool("foco", false);
                animSetaP1.SetBool("aparecer", true);
                animSetaP2.SetBool("aparecer", false);
                imagemExpressaoP1.sprite = expressoesP1[2];
                imagemExpressaoP2.sprite = expressoesP2[3];
            }

            if (falaAtual >= 24)
            {
                PodeAvancarFala = false;
            }
        }
        if (!PodeAvancarFala)
        {
            animAtual++;
            Debug.Log("Animacao Atual:" + animAtual);
            if (animAtual == 0)
            {
                animPainelP1.Play("FecharPainelP1");
                animPainelP2.Play("FecharPainelP2");
                painelBlur.SetActive(false);
                animPainelFala.SetBool("abrirFalas", false);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", false);
                animDesenhosGrandes.SetTrigger("AvancarEstado");
            }

            if (animAtual == 1)
            {
                animDesenhosGrandes.SetTrigger("AvancarEstado");
            }

            if (animAtual == 2)
            {
                painelBlur.SetActive(true);
                animPainelFala.SetBool("abrirFalas", true);
                animSetaP1.SetBool("aparecer", false);
                animSetaP2.SetBool("aparecer", true);
                animPainelP2.SetTrigger("AtivarPainelPersonagem");
                animPainelP2.SetBool("foco", true);
                imagemExpressaoP2.sprite = expressoesP2[2];
                falaAtual++;
                if (falaAtual > 0 && falaAtual < falas.Length)
                    textoFala.text = falas[falaAtual];
                PodeAvancarFala = true;
            }

            if (animAtual == 3)
            {
                animPainelP2.Play("FecharPainelP2");
                painelBlur.SetActive(false);
                animPainelFala.SetBool("abrirFalas", false);
                animSetaP2.SetBool("aparecer", false);
                animDesenhosGrandes.SetTrigger("AvancarEstado");
            }

            if(animAtual == 4)
            {
                animEscurecerTela.SetTrigger("Escurecer");
            }
        }
    }

    public void serAgressivo()
    {
        Pacifico = false;
        animDesenhosGrandes.SetTrigger("SerAgressivo");
        animPainelBotoes.SetBool("PainelAceiRecuAbrir", false);
        falaAtual = -1;
    }

    public void serPacifico()
    {
        Pacifico = true;
        animDesenhosGrandes.SetTrigger("SerPacifico");
        animPainelBotoes.SetBool("PainelAceiRecuAbrir", false);
        falaAtual = 12;

    }

    public void trocarFala()
    {
        if (fala == Fala.FalaKatzen)
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
