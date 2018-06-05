using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class DeletePlayerPrefs : MonoBehaviour {

    [MenuItem("Tools/DeleteMyPlayerPrefs")]
    static void DeleteMyPlayerPrefs()
    {
        PlayerPrefs.DeleteAll();
    }
}
