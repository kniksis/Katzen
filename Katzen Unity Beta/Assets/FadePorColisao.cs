using UnityEngine;
using UnityEngine.SceneManagement;

public class FadePorColisao : MonoBehaviour {

	[SerializeField]
	GameObject TrocarColGO;
	[SerializeField]
	TrocarNivelPorColisao TCScript;

	[SerializeField]
	GameObject LevelLoaderGO;
	[SerializeField]
	LevelLoader LLScript;

	public Animator animator;

	private string carregarNivel;
	void Awake()
	{
		TrocarColGO = GameObject.Find("Pequena_Floresta/Cross/Base");
		TCScript = TrocarColGO.GetComponent<TrocarNivelPorColisao>();
		LevelLoaderGO = GameObject.Find("Loader");
		LLScript = LevelLoaderGO.GetComponent<LevelLoader>();
	}

	void Update()
	{
		if(TCScript.colidiu == true)
		{
			Debug.Log("Prx");
			FadeParaLevel();
		}
	}

	public void FadeParaLevel()
	{

		Debug.Log("fadeout");
		animator.SetTrigger("FadeOut");

		Debug.Log("trocacena");
	}

	public void OnFadeComplete()
	{
		LLScript.LoadLevel("Menu");
	}
}
