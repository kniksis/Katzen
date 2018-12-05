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
    public Animator animTelaPreta;
    public Animator animDesenhosGrandes;
    public Animator animEscurecerTela;
    
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

    // Use this for initialization
    void Start () {
        textFile = Resources.Load<TextAsset>("Falas/Cena02_Intruso_na_igreja");
        string[] linhasArquivo = textFile.text.Split('\n'); // quebra por linhaso arquivo e atribui a uma lista de strings
        falas = new string[linhasArquivo.Length];
        int contadorFala = 0;

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
        falaAtual = -1;
        textoFala.text = falas[0];
    }
	
	// Update is called once per frame
	void Update () {
        if (Input.GetButton("Atirar") && falaAtual < 0)
        {
            avancarFala();
        }

        if (falaAtual == 4)
        {
            tempoProxCena -= Time.deltaTime;
            if (tempoProxCena <= 0.0f)
            {
                LoadLevel(ProximaFaseNome);
                falaAtual = 0;
            }
        }
    }

    public void avancarFala()
    {
        falaAtual += 1;
        Debug.Log(falaAtual);

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

        if(falaAtual == 1)
        {
            animPainelP1.SetBool("foco", false);
            animPainelP2.SetBool("foco", true);
            animSetaP1.SetBool("aparecer", false);
            animSetaP2.SetBool("aparecer", true);
            imagemExpressaoP2.sprite = expressoesP2[1];
        }


        if (falaAtual == 2)
        {
            imagemExpressaoP2.sprite = expressoesP2[2];
        }
        if(falaAtual == 3)
        {
            animPainelP1.SetBool("foco", true);
            animPainelP2.SetBool("foco", false);
            animSetaP1.SetBool("aparecer", true);
            animSetaP2.SetBool("aparecer", false);
            animDesenhosGrandes.SetTrigger("ProximoEvento");
            imagemExpressaoP2.sprite = expressoesP2[3];
        }
        if(falaAtual == 4)
        {
            animSetaP1.SetBool("aparecer", false);
            animSetaP2.SetBool("aparecer", false);
            animPainelFala.SetBool("abrirFalas", false);
            animPainelP1.Play("FecharPainelP1");
            animPainelP2.Play("FecharPainelP2");
            animEscurecerTela.SetTrigger("Escurecer");
            painelBlur.SetActive(false);
        }
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
