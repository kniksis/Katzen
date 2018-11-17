using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class JogadorInputs : MonoBehaviour
{
    public static JogadorInputs Instance
    {
        get { return s_Instance; }
    }

    protected static JogadorInputs s_Instance;

    
    public bool JogadorInputsBloqueados;

    protected Vector2 MovimentoCtrl;
    protected Vector2 CameraCtrl;
    protected bool PuloBt;
    protected bool AtaqueBt;
    protected bool PauseBt;
    protected bool MirarBt;
    protected bool InputExternoBloqueados;

    [Header("Inputs Nomes")]
    public string JUMP_BT_NAME;
    public string MOV_HORIZONTAL_AN_NAME;
    public string MOV_VERTICAL_AN_NAME;
    public string CAM_HORIZONTAL_AN_NAME;
    public string CAM_VERTICAL_AN_NAME;
    public string TROCA_ARMA_BT_NAME;
    public string MIRAR_BT_NAME;
    public string ATIRAR_BT_NAME;
    public string ATACAR_BT_NAME;
    public string PAUSE_BT_NAME;

    public Vector2 MoveInput
    {
        get
        {
            //if (JogadorInputsBloqueados || InputExternoBloqueados)
            //    return Vector2.zero;
            return MovimentoCtrl;
        }
    }

    public Vector2 CameraInput
    {
        get
        {
            //if (JogadorInputsBloqueados || InputExternoBloqueados)
            //    return Vector2.zero;
            return CameraCtrl;
        }
    }

    public bool PuloInput
    {
        get { return PuloBt /*&& !JogadorInputsBloqueados && !InputExternoBloqueados*/; }
    }

    public bool AtaqueInput
    {
        get { return AtaqueBt /*&& !JogadorInputsBloqueados && !InputExternoBloqueados*/; }
    }

    public bool PauseInput
    {
        get { return PauseInput; }
    }

    WaitForSeconds AtaqueInputDelay;
    Coroutine AtaqueEsperaCorotina;

    const float AtaqueInputDuracao = 0.03f;

    void Awake()
    {
        AtaqueInputDelay = new WaitForSeconds(AtaqueInputDuracao);

        if (s_Instance == null)
            s_Instance = this;
        else if (s_Instance != this)
            throw new UnityException("Não pode haver mais de um script JogadorInput. As instâncias são  " + s_Instance.name + " e " + name + ".");//Verifica se ha mais de uma instancia de JogadorInputs
    }


    void Update()
    {
        MovimentoCtrl.Set(Input.GetAxis(MOV_HORIZONTAL_AN_NAME), Input.GetAxis(MOV_VERTICAL_AN_NAME));
        CameraCtrl.Set(Input.GetAxis(CAM_HORIZONTAL_AN_NAME), Input.GetAxis(CAM_VERTICAL_AN_NAME));
        PuloBt = Input.GetButton(JUMP_BT_NAME);

        if (Input.GetButtonDown(ATACAR_BT_NAME))
        {
            if (AtaqueEsperaCorotina != null)
                StopCoroutine(AtaqueEsperaCorotina);

            AtaqueEsperaCorotina = StartCoroutine(AttackWait());
        }

        PauseBt = Input.GetButtonDown(PAUSE_BT_NAME);
    }

    IEnumerator AttackWait()
    {
        AtaqueBt = true;

        yield return AtaqueInputDelay;

        AtaqueBt = false;
    }

    //public bool HaveControl()
    //{
    //    return !InputExternoBloqueados;
    //}

    //public void ReleaseControl()
    //{
    //    InputExternoBloqueados = true;
    //}

    //public void GainControl()
    //{
    //    InputExternoBloqueados = false;
    //}
}

