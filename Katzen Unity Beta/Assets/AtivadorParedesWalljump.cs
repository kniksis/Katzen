using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AtivadorParedesWalljump : MonoBehaviour {

    public GameObject ParedeDireita;
    public GameObject ParedeEsquerda;
    [SerializeField]
    ParedeWallJumpDetectaColisaoDir pDirScript;
    [SerializeField]
    ParedeWallJumpDetectaColisaoEsq pEsqScript;
    [SerializeField]
    GameObject JogadorGO;
    [SerializeField]
    JogCharacterMov JogScript;
    JogadorInputs JogInputScript;

    // Use this for initialization
    void Start () {
        pDirScript = ParedeDireita.GetComponent<ParedeWallJumpDetectaColisaoDir>();
        pEsqScript = ParedeEsquerda.GetComponent<ParedeWallJumpDetectaColisaoEsq>();
        JogadorGO = GameObject.Find("Katzen Character");
        JogScript = JogadorGO.GetComponent<JogCharacterMov>();
        JogInputScript = JogadorGO.GetComponent<JogadorInputs>();
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        if (pDirScript.jogadorColidiuDir && !JogScript.noChao && JogInputScript.PuloInput)
        {
            JogScript.numPulos = 0;
            ParedeDireita.gameObject.layer = 0;
            if(ParedeEsquerda.gameObject.layer == 0)
            {
                ParedeEsquerda.gameObject.layer = 11;
            }
        }

        if (pEsqScript.jogadorColidiuEsq && !JogScript.noChao && JogInputScript.PuloInput)
        {
            JogScript.numPulos = 0;
            ParedeEsquerda.gameObject.layer = 0;
            if (ParedeDireita.gameObject.layer == 0)
            {
                ParedeDireita.gameObject.layer = 11;
            }
        }

        if(JogScript.noChao)
        {
            if (ParedeEsquerda.gameObject.layer == 0)
            {
                ParedeEsquerda.gameObject.layer = 11;
            }

            if (ParedeDireita.gameObject.layer == 0)
            {
                ParedeDireita.gameObject.layer = 11;
            }
        }
    }
}
