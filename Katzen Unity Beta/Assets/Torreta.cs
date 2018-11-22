using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Torreta : MonoBehaviour {

    //public List<GameObject> InimigoAtualLocalizado = new List<GameObject>();

    //---- Identifica um por um ----
    public Animator animator;
    public GameObject InimigoAtualLocalizado;

    public float RaioAim;
    public float DistanciaMaxima;
    public LayerMask layerMask;

    public bool HaInimigos;
    public GameObject InimigoParaMirar;
    public GameObject OrigemRaioDeMira;

    private Vector3 Origem;
    private Vector3 Direcao;
    [SerializeField]
    private GameObject apontar;

    [SerializeField]
    private float InimigoAtualDistancia;
    
    public Transform targetTR;
    public float delayGiro = 5;

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
        Origem = OrigemRaioDeMira.transform.position;
        Direcao = transform.forward;
    }
	
	// Update is called once per frame
	void Update () {

        VerificaShereCast();
        MirarNoJog();
        AtirarNoJog();
    }
    private void OnDrawGizmos()
    {
        Gizmos.color = Color.red;

        if (InimigoAtualLocalizado != null)
        {
            Debug.DrawLine(transform.position, InimigoAtualLocalizado.transform.position, Color.yellow);
            GetInimigoMaisProximo();
        }

        Gizmos.DrawWireSphere(Origem + Direcao * InimigoAtualDistancia, RaioAim);
    }

    private void AtirarNoJog()
    {
        if (InimigoParaMirar != null)
        {
            if (Time.time > nextFire)
            {
                nextFire = Time.time + fireRate;
                Rigidbody tiroInstancia = Instantiate(tiro, respawnTiro.position, respawnTiro.rotation) as Rigidbody;

                tiroInstancia.velocity = forcaAtual * respawnTiro.forward;
                animator.SetTrigger("Atirar");
                //atirar = true;
                //GameObject temp = gop.ObterObjeto();
                //if(temp != null)
                //{
                //temp.transform.position = respawnTiro.transform.position;
                //temp.transform.rotation = respawnTiro.transform.rotation;
                //temp.SetActive(true);
            }
        }
    }

    private void MirarNoJog()
    {
        if (InimigoParaMirar != null)
        {
            Vector3 dirFromToTarget = InimigoParaMirar.transform.position - apontar.transform.position;
            Quaternion lookRotation = Quaternion.LookRotation(dirFromToTarget);
            apontar.transform.rotation = Quaternion.Lerp(apontar.transform.rotation, lookRotation, Time.deltaTime * (delayGiro / 360.0f));

            float deg = apontar.transform.rotation.y * Mathf.Rad2Deg;//Converte radianos para graus.
            animator.SetFloat("DirecaoMiraY", deg * 1.6f);
        }

        //Se não volta a mira com Lerp
        else
        {
            apontar.transform.rotation = Quaternion.Lerp(apontar.transform.rotation, this.transform.rotation, Time.deltaTime * (delayGiro / 360.0f));
            float deg = apontar.transform.rotation.y * Mathf.Rad2Deg;//Converte radianos para graus.
            animator.SetFloat("DirecaoMiraY", deg * 1.6f);
        }
    }

    private void VerificaShereCast()
    {
        //---- Identifica um por um ----
        RaycastHit hit;

        if (Physics.SphereCast(Origem, RaioAim, Direcao, out hit, DistanciaMaxima, layerMask, QueryTriggerInteraction.UseGlobal))
        {
            InimigoAtualLocalizado = hit.transform.gameObject;
            InimigoAtualDistancia = hit.distance;
        }
        else
        {
            InimigoAtualDistancia = DistanciaMaxima;
            InimigoAtualLocalizado = null;
        }

        if (InimigoAtualLocalizado)
        {
            HaInimigos = true;
        }
        else
        {
            HaInimigos = false;
            InimigoParaMirar = null;
        }
    }

    void GetInimigoMaisProximo()
    {
        float distanciaParaInimigoProixmo = Mathf.Infinity;
        //JogMoveCharacter InimigoProximo = null;
        //JogMoveCharacter allInimigos = GameObject.FindObjectOfType<JogMoveCharacter>();
        //JogMoveCharacter InimigoAtual = allInimigos;

        if (InimigoAtualLocalizado != null)
        {
            float distanciaParaInimigo = (InimigoAtualLocalizado.transform.position - this.transform.position).sqrMagnitude;
            if (distanciaParaInimigo < distanciaParaInimigoProixmo)
            {
                distanciaParaInimigoProixmo = distanciaParaInimigo;
                InimigoParaMirar = InimigoAtualLocalizado.gameObject;
                //InimigoProximo = InimigoAtualLocalizado;
                //InimigoParaMirar = InimigoProximo.gameObject;
            }
        }
    }
}