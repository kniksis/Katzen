using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.SceneManagement;

public class PauseMenu : MonoBehaviour {

    [SerializeField]
    GameObject PausePainel;
    [SerializeField]
    GameObject ContinuePainel;
    [SerializeField]
    GameObject OpcoesPainel;
    [SerializeField]
    GameObject VideoPainel;
    [SerializeField]
    GameObject ControlesPainel;
    [SerializeField]
    GameObject AudioPainel;
    [SerializeField]
    GameObject PrimeiroBotaoContextual;
    [SerializeField]
    GameObject voltaOpcoesBotaoContextual;
    [SerializeField]
    EventSystem eventSystem;
    public string CenaAtual;
    public static bool GameIsPaused = false;

    public enum EstadoMenu
    {
        Pause = 0,
        Opcoes = 1,
        SubOpcoes
    }

    public EstadoMenu estadoMenu = EstadoMenu.Opcoes;

    // Use this for initialization
    void Start () {
        PausePainel.SetActive(false);
        AudioListener.pause = false;
        Cursor.lockState = CursorLockMode.Locked;
    }
	
	// Update is called once per frame
	void Update () {
        if(Input.GetButtonDown("Pause"))
        {
            if (GameIsPaused && estadoMenu == EstadoMenu.Pause)
            {
                Resume();
            }
            else
            {
                Pause();
                Cursor.lockState = CursorLockMode.None;
            }
        }

        if (Input.GetButtonDown("PauseGamepad"))
        {
            if (GameIsPaused && estadoMenu == EstadoMenu.Pause)
            {
                Resume();
            }
            else
            {
                Pause();
            }
        }

        if(GameIsPaused && Input.GetButtonDown("Cancel"))
        {
            Pause();
        }

        if(Input.GetKeyDown(KeyCode.T))
        {
            if(Time.timeScale == 1.0f)
            Time.timeScale = 0.2f;
            else
            {
                Time.timeScale = 1.0f;
            }
        }
    }

    public void Pause()
    {
        if (estadoMenu == EstadoMenu.Pause)
        {
            PausePainel.SetActive(true);
            Time.timeScale = 0.0f;
            AudioListener.pause = true;
            GameIsPaused = true;
            VoltarMenuPause();
        }

        if (estadoMenu == EstadoMenu.Opcoes)
        {
            VoltarMenuPause();
        }

        if (estadoMenu == EstadoMenu.SubOpcoes)
        {
            VoltarsMenuOpcoes();
        }
    }

    public void Resume()
    {
        PausePainel.SetActive(false);
        Time.timeScale = 1.0f;
        GameIsPaused = false;
        AudioListener.pause = false;
        Cursor.lockState = CursorLockMode.Locked;
        eventSystem.SetSelectedGameObject(PrimeiroBotaoContextual);
    }

    public void Restart()
    {
        Time.timeScale = 1.0f;
        SceneManager.LoadScene(CenaAtual);
    }

    public void RestartCheckpoint()
    {
        Debug.Log("Restart Checkpoint");
    }

    public void Sair()
    {
        Time.timeScale = 1.0f;
        SceneManager.LoadScene("Menu");
    }

    public void SetEstOpcoes()
    {
        estadoMenu = EstadoMenu.Opcoes;
    }

    public void SetEstSubOpcoes()
    {
        estadoMenu = EstadoMenu.SubOpcoes;
    }

    public void SetEstPause()
    {
        estadoMenu = EstadoMenu.Pause;
    }

    public void VoltarMenuPause()
    {
        ContinuePainel.SetActive(true);
        OpcoesPainel.SetActive(false);
        VideoPainel.SetActive(false);
        ControlesPainel.SetActive(false);
        AudioPainel.SetActive(false);
        eventSystem.SetSelectedGameObject(PrimeiroBotaoContextual);
        estadoMenu = EstadoMenu.Pause;
    }

    public void VoltarsMenuOpcoes()
    {
        ContinuePainel.SetActive(false);
        OpcoesPainel.SetActive(true);
        VideoPainel.SetActive(false);
        ControlesPainel.SetActive(false);
        AudioPainel.SetActive(false);
        eventSystem.SetSelectedGameObject(voltaOpcoesBotaoContextual);
        estadoMenu = EstadoMenu.Opcoes;
    }
}