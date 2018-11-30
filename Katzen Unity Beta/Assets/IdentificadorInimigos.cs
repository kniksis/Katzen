using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IdentificadorInimigos : MonoBehaviour
{

    //---- Identifica uma sequencia ----
    public List<GameObject> InimigoAtualLocalizado = new List<GameObject>();

    //---- Identifica um por um ----
    //public GameObject InimigoAtualLocalizado;

    public float RaioAim;
    public float DistanciaMaxima;
    public LayerMask layerMask;

    public bool HaInimigos;
    public GameObject InimigoParaMirar;

    private Vector3 Origem;
    private Vector3 Direcao;

    [SerializeField]
    private float InimigoAtualDistancia;

    // Use this for initialization
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        Origem = transform.position;
        Direcao = transform.forward;
        //---- Identifica um por um ----
        /* RaycastHit hit;

         if (Physics.SphereCast(Origem, RaioAim, Direcao, out hit, DistanciaMaxima, layerMask, QueryTriggerInteraction.UseGlobal))
         {
             InimigoAtualLocalizado = hit.transform.gameObject;
             InimigoAtualDistancia = hit.distance;
         }
         else
         {
             InimigoAtualDistancia = DistanciaMaxima;
             InimigoAtualLocalizado = null;
         }*/


        InimigoAtualDistancia = DistanciaMaxima;
        InimigoAtualLocalizado.Clear();

        RaycastHit[] hits = new RaycastHit[10];
        int NumeroDeHits = Physics.SphereCastNonAlloc(Origem, RaioAim, Direcao, hits, DistanciaMaxima, layerMask, QueryTriggerInteraction.UseGlobal);

        float distanciaParaInimigoProixmo = Mathf.Infinity;
        for (int i = 0; i < NumeroDeHits; i++)
        {
            InimigoAtualLocalizado.Add(hits[i].transform.gameObject);
            InimigoAtualDistancia = hits[i].distance;
            if (hits[i].distance < distanciaParaInimigoProixmo)
            {
                InimigoParaMirar = hits[i].collider.gameObject;
                distanciaParaInimigoProixmo = hits[i].distance;
            }
        }

        //---- Identifica uma sequencia ----
        /*
        RaycastHit[] hits = Physics.SphereCastAll(Origem, RaioAim, Direcao, DistanciaMaxima, layerMask, QueryTriggerInteraction.UseGlobal);
        foreach(RaycastHit hit in hits)
        {
            InimigoAtualLocalizado.Add(hit.transform.gameObject);
            InimigoAtualDistancia = hit.distance;
        }*/

        if (InimigoAtualLocalizado.Count > 0)
        {
            HaInimigos = true;
        }
        else
        {
            HaInimigos = false;
            InimigoParaMirar = null;
        }
    }

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Debug.DrawLine(Origem, Origem + Direcao * InimigoAtualDistancia, Color.blue);
        RaycastHit[] hits = new RaycastHit[10];
        int NumeroDeHits = Physics.SphereCastNonAlloc(Origem, RaioAim, Direcao, hits, DistanciaMaxima, layerMask, QueryTriggerInteraction.UseGlobal);
        for (int i = 0; i < NumeroDeHits; i++)
        {
            Debug.DrawLine(Origem, InimigoAtualLocalizado[i].transform.position, Color.yellow);

            if (InimigoAtualLocalizado != null)
            {
                //int maisProximo = InimigoAtualDistancia; 
                //InimigoAtualLocalizado[i].GetComponent<Renderer>().material.color = Color.blue;
            }
        }
        Gizmos.DrawWireSphere(Origem + Direcao * InimigoAtualDistancia, RaioAim);
    }

    //void GetInimigoMaisProximo()
    //{
    //    float distanciaParaInimigoProixmo = Mathf.Infinity;
        
    //    foreach (LocalizadorInimigo InimigoAtual in allInimigos)
    //    {
    //        float distanciaParaInimigo = (InimigoAtual.transform.position - this.transform.position).sqrMagnitude;
    //        if (distanciaParaInimigo < distanciaParaInimigoProixmo)
    //        {
    //            distanciaParaInimigoProixmo = distanciaParaInimigo;
    //            InimigoProximo = InimigoAtual;
    //            InimigoProximo.GetComponent<Renderer>().material.color = Color.blue;
    //            InimigoParaMirar = InimigoProximo.gameObject;
    //        }
    //    }
    //}
}