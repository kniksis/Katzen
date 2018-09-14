using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class Player : MonoBehaviour {
	static public Inventario _inventarioPlayer;
	public GameObject inventario;

	// Use this for initialization
	void Start () {
		_inventarioPlayer = inventario.GetComponent<Inventario>();
	}

	// Update is called once per frame
	void Update()
	{
		if (Input.GetKey("r"))
		{
			SceneManager.LoadScene("NivelBeta");
		}
	}
	private void OnTriggerEnter(Collider collision)
	{
		if (collision.CompareTag("Agua"))
		{
			SceneManager.LoadScene("GameOver");
		}

		if (collision.CompareTag("WallJump"))
		{
			SceneManager.LoadScene("NivelWallJump");
		}
	}
}
