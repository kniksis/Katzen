using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Torreta : MonoBehaviour {

    //public List<GameObject> InimigoAtualLocalizado = new List<GameObject>();

    //---- Identifica um por um ----
    public Animator animator;


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
    public float nextFire = 0.0f;
    public float forcaAtual;

    public bool atirar;


    void Awake()
    {
        atirar = false;
    }
    // Use this for initialization
    void Start () {

    }
	
	// Update is called once per frame
	void Update () {
        MirarNoJog();
        AtirarNoJog();
        if(MiraDaTorretaScript.jogEntrou)
        {
            JogadorDistancia = Vector3.Distance(MiraDaTorretaScript.jogadorGO.transform.position, transform.position);
            print("Distance to other: " + JogadorDistancia);
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
                Time.timeScale = 0.4f;
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
}