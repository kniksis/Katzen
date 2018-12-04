using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;

public class ConversaKaokaoa02 : MonoBehaviour {

    public Animator animSetaP1;
    public Animator animSetaP2;
    public Animator animPainelP1;
    public Animator animPainelP2;
    public Animator animPainelFala;
    public Animator animTelaPreta;
    public Animator animFundo;
    public Animator animAceiRecu;

    public GameObject painelPreto;
    public GameObject painelBlur;

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

    // Use this for initialization
    void Start () {
        textFile = Resources.Load<TextAsset>("Falas/Cena01_Neiriel_Katzen");
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
        textoFala.text = falas[0];
        textoFalasTelaPreta.text = falas[0];
    }
	
	// Update is called once per frame
	void Update () {
        lerTextoArquivo();
        if (Input.GetButtonDown("Atirar") && falaAtual <= 3)
        {
            avancarFala();
        }
    }
    bool corrigiCinco = false;

    public void avancarFala()
    {
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
        }

        if(falaAtual == 32)
        {
            animSetaP1.SetBool("aparecer", false);
            animSetaP2.SetBool("aparecer", false);
            animPainelP1.Play("FecharPainelP1");
            animPainelP2.Play("FecharPainelP2");
            animPainelFala.SetBool("abrirFalas", false);
            textoFala.text = "";
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

    void lerTextoArquivo()
    {
        
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
}
