using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Torreta : MonoBehaviour {
    
    //---- Identifica um por um ----
    public Animator animator;
    [SerializeField]
    GameObject JogMCGO;
    [SerializeField]
    JogCharacterMov JogMCScript;

    [Header("Variaveis da mira")]
    
    public JogEntrouMira MiraDaTorretaScript;
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

    float vidaTorreta;

    void Awake()
    {
        atirar = false;
        vidaTorreta = 100;
    }
    // Use this for initialization
    void Start ()
    {
        JogMCGO = GameObject.Find("Katzen Character");
        JogMCScript = JogMCGO.GetComponent<JogCharacterMov>();
    }
	
	// Update is called once per frame
	void Update () {
        MirarNoJog();
        AtirarNoJog();
        if(MiraDaTorretaScript.jogEntrou)
        {
            JogadorDistancia = Vector3.Distance(MiraDaTorretaScript.jogadorGO.transform.position, transform.position);
        }
    }

    private void AtirarNoJog()
    {
        if (MiraDaTorretaScript.jogEntrou)
        {
            if (Time.time > nextFire)
            {
                nextFire = Time.time + fireRate;
                Rigidbody tiroInstancia = Instantiate(tiro, respawnTiro.position, respawnTiro.rotation) as Rigidbody;

                tiroInstancia.velocity = (forcaAtual + JogadorDistancia / 2.5f) * respawnTiro.forward;
                //Time.timeScale = 0.4f;
                animator.SetTrigger("Atirar");
            }
        }
    }

    private void MirarNoJog()
    {
        if (MiraDaTorretaScript.jogEntrou)
        {
            Vector3 dirFromToTarget = MiraDaTorretaScript.jogadorGO.transform.position - apontar.transform.position;
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
            animator.SetFloat("DirecaoMiraY", deg * CorrecaoDeMira);
        }
    }
    public GameObject particulaDano;
    private Vector3 tmpContactPoint;
    private Vector3 tmpDirection;

    public void SeMorreu()
    {
        if (vidaTorreta <= 0)
        {
            Destroy(gameObject);
        }
    }

    private void OnTriggerEnter(Collider other)
    {
        if ((other.gameObject.tag == "Garras" && JogMCScript.Atacando) || (other.gameObject.tag == "TiroJogador"))
        {
            LevarDano(other);
            Debug.Log("Levar Dano Por ENTER");
            vidaTorreta -= 20;
            Debug.Log(vidaTorreta);
            SeMorreu();
        }
    }

    private void OnTriggerStay(Collider other)
    {
        if (other.gameObject.tag == "Garras" && JogMCScript.Atacando && Time.time > proximoSoco)
        {
            proximoSoco = Time.time + RateCombo;
            Debug.Log("Levar Dano Por STAY");
            LevarDano(other);
            vidaTorreta -= 20;
            Debug.Log(vidaTorreta);
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
}