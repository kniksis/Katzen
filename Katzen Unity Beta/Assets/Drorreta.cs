using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

using System.IO;
using UnityEngine.UI;

public class Drorreta : MonoBehaviour
{

    //---- Identifica um por um ----
    public Animator animator;
    [SerializeField]
    GameObject JogMCGO;
    [SerializeField]
    JogCharacterMov JogMCScript;

    public AudioSource fonteSomTorreta;
    public AudioClip somLevarDano;
    public AudioClip somLancarTiro;

    [Header("Variaveis da mira")]

    public JogEntrouMira MiraDaDrorretaScript;
    public float CorrecaoDeMira;

    [SerializeField]
    private GameObject apontar;

    [SerializeField]
    private float JogadorDistancia;

    public float delayGiro = 5;

    [Header("Variaveis de tiro")]
    public Rigidbody tiro;
    public Transform respawnTiro;

    public float fireRate = 0.5f;
    private float nextFire = 0.0f;

    public float RateCombo = 0.3f;
    private float proximoSoco = 0.0f;
    public float forcaAtual;

    public bool atirar;

    public int vidaDrorreta;

    public GameObject loadingScreen;
    public Slider slider;
    public Text progressText;
    public string ProximaFaseNome;

    void Awake()
    {
        atirar = false;
    }
    // Use this for initialization
    void Start()
    {
        vidaDrorreta = 100;
        JogMCGO = GameObject.Find("Katzen Character");
        JogMCScript = JogMCGO.GetComponent<JogCharacterMov>();
    }

    // Update is called once per frame
    void Update()
    {
        MirarNoJog();
        AtirarNoJog();
        if (MiraDaDrorretaScript.jogEntrou)
        {
            JogadorDistancia = Vector3.Distance(MiraDaDrorretaScript.jogadorGO.transform.position, transform.position);
        }
    }

    private void AtirarNoJog()
    {
        if (MiraDaDrorretaScript.jogEntrou)
        {
            if (Time.time > nextFire)
            {
                nextFire = Time.time + fireRate;
                Rigidbody tiroInstancia = Instantiate(tiro, respawnTiro.position, respawnTiro.rotation) as Rigidbody;
                fonteSomTorreta.clip = somLancarTiro;
                fonteSomTorreta.Play();
                tiroInstancia.velocity = (forcaAtual + JogadorDistancia / 2.5f) * respawnTiro.forward;
                //Time.timeScale = 0.4f;
                animator.SetTrigger("Atirar");
            }
        }
    }

    private void MirarNoJog()
    {
        if (MiraDaDrorretaScript.jogEntrou)
        {
            Vector3 dirFromToTarget = MiraDaDrorretaScript.jogadorGO.transform.position - apontar.transform.position;
            Quaternion lookRotation = Quaternion.LookRotation(dirFromToTarget);
            apontar.transform.rotation = Quaternion.Lerp(apontar.transform.rotation, lookRotation, Time.deltaTime * (delayGiro / 360.0f));//Faço uso de um gameobjec vazio para mirar no jogador, apos isso eu uso o seu valor de y de rotacao para a mira com animacao

            float deg = apontar.transform.localRotation.y * Mathf.Rad2Deg;//Converte   graus radianos.
            animator.SetFloat("DirecaoMiraY", deg * CorrecaoDeMira);//1.6f é para um ajuste mais perfeito de mira, para que ela não fique olhando atrasada.
        }

        //Se não houver ninguem para mirar volta com Lerp para o estado padrão
        else
        {
            apontar.transform.rotation = Quaternion.Lerp(apontar.transform.rotation, this.transform.rotation, Time.deltaTime * (delayGiro / 360.0f));
            float deg = apontar.transform.localRotation.y * Mathf.Rad2Deg;//Converte radianos para graus.
            Debug.Log(deg);
            animator.SetFloat("DirecaoMiraY", deg / CorrecaoDeMira);
        }
    }
    public GameObject particulaDano;
    private Vector3 tmpContactPoint;
    private Vector3 tmpDirection;

    public void SeMorreu()
    {
        if (vidaDrorreta <=0)
        {
            LoadLevel(ProximaFaseNome);
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if ((other.gameObject.tag == "Garras" && JogMCScript.Atacando) || (other.gameObject.tag == "TiroJogador"))
        {
            LevarDano(other);
            Debug.Log("Levar Dano Por ENTER");
            vidaDrorreta -= 15;
            fonteSomTorreta.clip = somLevarDano;
            fonteSomTorreta.Play();
            Debug.Log(vidaDrorreta);
            SeMorreu();
        }
    }

    private void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Garras" && JogMCScript.Atacando && Time.time > proximoSoco)
        {
            proximoSoco = Time.time + RateCombo;
            Debug.Log("Levar Dano Por STAY");
            vidaDrorreta -= 15;
            Debug.Log(vidaDrorreta);
            fonteSomTorreta.clip = somLevarDano;
            fonteSomTorreta.Play();
            LevarDano(other);
            SeMorreu();
        }
    }

    void LevarDano(Collider other)
    {
        tmpDirection = (other.transform.position - transform.position);
        tmpContactPoint = transform.position + tmpDirection;

        Instantiate<GameObject>(particulaDano, tmpContactPoint, transform.rotation);
        animator.SetTrigger("LevarDano");
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