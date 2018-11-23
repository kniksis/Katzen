using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JogAtirar : MonoBehaviour
{
    [Header("Componentes")]
    public Transform respawnTiro;
	public Rigidbody tiro;
    public AudioSource TiroAudioOrigem;
    public AudioClip CarregandoClip;
    public AudioClip AtirouClip;

    public Animator animJog;
    public Animator animHUDArmas;
    public Animator animEstilingue;

    [Header("Variaveis")]
    public float ForcaMinima = 15f;
    public float ForcaMaxima = 30f;
    public float TempoMaximoForca = 0.75f;

    public float TiroFrequencia = 0.5f;
    public float ProximoTiro = 0.0f;
    private float ForcaAtual;
    private float VelocidadeForca;
    private bool atirou;
    private bool AtirarInput;

    float ForcaLancamentoAnim;

    GameObject gameManagerGO;
	GameManager gmScript;
    
    JogCharacterMov jogMoveScript;
    
    protected JogadorInputs input;
    public string ATIRAR_BT_NAME;
    public string ATIRAR_AN_NAME;


    private void OnEnable()
    {
        ForcaAtual = ForcaMinima;
    }
    // Use this for initialization
    void Start () {
		gameManagerGO = GameObject.Find("Manager");
		gmScript = gameManagerGO.GetComponent<GameManager>();

        AtirarInput = Input.GetButton(ATIRAR_BT_NAME);

        VelocidadeForca = (ForcaMaxima - ForcaMinima) / TempoMaximoForca;

    }

    private void Awake()
    {
        input = GetComponent<JogadorInputs>();
    }

    // Update is called once per frame
    void Update () {

        //if(ForcaAtual >= ForcaMaxima && !atirou)
        //{
        //    ForcaAtual = ForcaMaxima;
        //    Atirar ();
        //}
        //if (Time.time > ProximoTiro)
        //{
        //    ProximoTiro = Time.time + TiroFrequencia;
        if (jogMoveScript.podeAtirar)
        {
            atirou = false;
            animJog.SetBool("Atirou", atirou);

            if (input.AtirarInput)
            {
                atirou = false;
                ForcaAtual = ForcaMinima;

                //Som atirar aqui
                //TiroAudioOrigem.clip = CarregandoClip;
                //TiroAudioOrigem.Play();
            }

            else if (Input.GetButton(ATIRAR_BT_NAME) && !atirou)
            {
                ForcaAtual += VelocidadeForca * Time.deltaTime;

                //Sloder e animacoes aqui
                //m_AimSlider.value = ForcaAtual;
                ForcaLancamentoAnim = (ForcaAtual) / ForcaMaxima;

                animJog.SetFloat("ForcaTiro", ForcaLancamentoAnim);
                animEstilingue.SetFloat("ForcaTiro", ForcaLancamentoAnim);
                animHUDArmas.SetFloat("ForcaEstilingue", ForcaLancamentoAnim);
            }

            else if (Input.GetButtonUp(ATIRAR_BT_NAME) && !atirou)
            {
                Atirar();
                animEstilingue.SetBool("Atirou", false);
            }
        }
    }

    private void Atirar()
    {
        atirou = true;

        Rigidbody tiroInstancia = Instantiate(tiro, respawnTiro.position, respawnTiro.rotation) as Rigidbody;

        tiroInstancia.velocity = ForcaAtual * respawnTiro.forward;
        //Ajustar Som
        //TiroAudioOrigem.clip = AtirouClip;
        //TiroAudioOrigem.Play();

        animEstilingue.CrossFade("Atirar", Time.deltaTime);
        animJog.SetBool("Atirou", atirou);
        animJog.CrossFade("AtirarEstilingue", Time.deltaTime);
        animJog.SetFloat("ForcaTiro", 0);
        animEstilingue.SetFloat("ForcaTiro", 0);
        animHUDArmas.SetFloat("ForcaEstilingue", 0);

        ForcaAtual = ForcaMinima;
    }
}