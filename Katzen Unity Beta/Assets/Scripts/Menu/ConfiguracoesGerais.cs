using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;
using UnityEngine.UI;

public class ConfiguracoesGerais : MonoBehaviour {

    public AudioMixer audioMixer;
    public Dropdown resolutionDropdown;
    //public float brilho;
    float rgbValue = 0.5f;

    Resolution[] resolutions;

    private void Start()
    {
        resolutions = Screen.resolutions;

        resolutionDropdown.ClearOptions();

        List<string> options = new List<string>();
        int currentResolutionIndex = 0;
        for (int i = 0; i < resolutions.Length; i++)
        {
            string option = resolutions[i].width + " x " + resolutions[i].height;
            options.Add(option);

            if(resolutions[i].width == Screen.currentResolution.width &&
                resolutions[i].height == Screen.currentResolution.height)//Compara as resoluçoes
            {
                currentResolutionIndex = i;
            }
        }

        resolutionDropdown.AddOptions(options);
        resolutionDropdown.value = currentResolutionIndex;//Seta para a resolução atual
        resolutionDropdown.RefreshShownValue();
    }

    public void SetVolumeMaster(float volume)
    {
        audioMixer.SetFloat("volumeGeral", volume);
    }

    public void SetVolumeMusica(float volume)
    {
        audioMixer.SetFloat("volumeMusica", volume);
    }

    public void SetVolumeAmbiete(float volume)
    {
        audioMixer.SetFloat("volumeAmbiente", volume);
    }
    
    public void SetVolumeVozes(float volume)
    {
        audioMixer.SetFloat("volumeVozes", volume);
    }

    public void SetVolumeUI(float volume)
    {
        audioMixer.SetFloat("volumeUI", volume);
    }

    public void SetResolution (int resolutionIndex)
    {
        Resolution resolution = resolutions[resolutionIndex];
        Screen.SetResolution(resolution.width, resolution.height, Screen.fullScreen);
    }

    public void SetQualidade(int qualidadeIndex)
    {
        QualitySettings.SetQualityLevel(qualidadeIndex);
    }

    public void SetBrilho(float brilhoIndex)
    {
        rgbValue = brilhoIndex;
        RenderSettings.ambientLight = new Color(rgbValue, rgbValue, rgbValue, 1);
    }

    public void SetFullscreen (bool isFullscreen)
    {
        Screen.fullScreen = isFullscreen;
    }

    public void InverterXCam(bool isInvertedX)
    {
        Debug.Log("Inverteu X" + isInvertedX);
    }

    public void InverterYCam(bool isInvertedY)
    {
        Debug.Log("Inverteu Y" + isInvertedY);
    }
    public void SetSencibilidadeCam(float sencibilidadeIndex)
    {
        Debug.Log("Sencibilidade da Camera: " + sencibilidadeIndex);
    }
}
