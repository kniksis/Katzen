using UnityEngine;
using UnityEngine.SceneManagement;

public class TrocarNivelPorColisao : MonoBehaviour
{

	public bool colidiu;

	public void Awake()
	{
		colidiu = false;
	}

	private void OnTriggerEnter(Collider collision)
	{
		if (collision.CompareTag("Player"))
		{
			colidiu = true;
		}
	}
}
