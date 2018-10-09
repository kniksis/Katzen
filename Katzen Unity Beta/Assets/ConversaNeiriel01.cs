using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System.IO;

public class ConversaNeiriel01 : MonoBehaviour {

    public Animator animSetaP1;
    public Animator animSetaP2;
    public Animator animPainelP1;
    public Animator animPainelP2;
    public Animator animPainelFala;

    public Image imagemExpressaoP1;
    public Image imagemExpressaoP2;

    public Sprite[] expressoesP1;
    public Sprite[] expressoesP2;

    public string TextoArquivo;

    public Text textoFala;
    public string[] falas;

    [SerializeField]
    public enum Fala
    {
        FalaNeiriel = 0,
        FalaKatzen = 1
    }

    public Fala fala = Fala.FalaNeiriel;

    // Use this for initialization
    void Start () {
        TextoArquivo = File.ReadAllText("Assets\\Falas\\Cena01_Neiriel_Katzen.txt");
        animPainelP1.SetBool("foco", true);
        animPainelP2.SetBool("foco", false);
        animPainelFala.SetBool("abrirFalas", true);
        animSetaP1.SetBool("aparecer", false);
        animSetaP2.SetBool("aparecer", false);
    }
	
	// Update is called once per frame
	void Update () {
        lerTextoArquivo();
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
            imagemExpressaoP1.sprite = expressoesP1[0];
            textoFala.text = falas[0];
            fala = Fala.FalaKatzen;
        }

        else
        {
            animPainelFala.Play("TrocarFala");
            animSetaP1.SetBool("aparecer", true);
            animSetaP2.SetBool("aparecer", false);
            animPainelP1.SetBool("foco", true);
            animPainelP2.SetBool("foco", false);
            imagemExpressaoP1.sprite = expressoesP1[2];
            textoFala.text = falas[1];
            fala = Fala.FalaNeiriel;
        }
    }

    void lerTextoArquivo()
    {
        
    }
}
