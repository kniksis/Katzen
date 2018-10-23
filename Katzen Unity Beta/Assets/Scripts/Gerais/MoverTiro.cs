using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoverTiro : MonoBehaviour {

	public float tiroForca;
	public float tempoDeVida;
	public float tempoDeVidaMax;
    public Rigidbody rb;

	// Use this for initialization
	void Start ()
	{
        rb = GetComponent<Rigidbody>();
	}

    private void OnEnable()
    {
        rb.useGravity = true;
        rb.AddForce(transform.forward * tiroForca, ForceMode.Impulse);
    }

    private void OnDisable()
    {
        rb.useGravity = false;
        tempoDeVida = 0;
    }

    // Update is called once per frame
    void Update ()
	{
		tempoDeVida += 1.0f * Time.fixedDeltaTime;

		if (tempoDeVida > tempoDeVidaMax)
		{
			gameObject.SetActive(false);
			tempoDeVida = 0;
		}
	}
}
