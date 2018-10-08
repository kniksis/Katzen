using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MirarNoJogador : MonoBehaviour
{
	[SerializeField]
	GameObject jogEntrouMiraGO;
	[SerializeField]
	JogEntrouMira jemScript;

    public GameObject PlayerTransform;
	public Transform targetTR;
	public float delayGiro = 5;

	void Awake()
	{
		jogEntrouMiraGO = GameObject.Find("MiraInimigo");
		jemScript = jogEntrouMiraGO.GetComponent<JogEntrouMira>();
        PlayerTransform = GameObject.FindGameObjectWithTag("Player");
        targetTR = PlayerTransform.transform;
	}
	// Use this for initialization

	void Start()
	{

	}

	// Update is called once per frame
	void Update()
	{
		if (jemScript.jogEntrou == true)
		{
			/*Vector3 targetPostition = new Vector3(targetObj.position.x,
											this.transform.position.y,
											targetObj.position.z);
			transform.LookAt(targetPostition);*/
			Vector3 dirFromToTarget = targetTR.position - transform.position;
			dirFromToTarget.y = 0.0f;
			Quaternion lookRotation = Quaternion.LookRotation(dirFromToTarget);
			transform.rotation = Quaternion.Lerp(transform.rotation, lookRotation, Time.deltaTime * (delayGiro / 360.0f));
		}
	}
}
