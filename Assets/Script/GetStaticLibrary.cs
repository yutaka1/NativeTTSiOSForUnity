using System;
using System.Runtime.InteropServices;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace MinimumExample
{

    sealed class GetStaticLibrary : MonoBehaviour
    {
        string message = "";
        [SerializeField] Button _button = default;
        [SerializeField] TMP_InputField _InputField = default;

        void Start()
        {
            _button.onClick.AddListener(() =>
            {
                //入力された文字をmessageに 
                message = _InputField.text;

                // プラグインの呼び出し
                var ret = SpeakMessage(message);
                Debug.Log($"戻り値: {ret}");

            });
        }

        #region P/Invoke

        // ObjectiveC++コードで実装した`Example`クラスのP/Invoke
        /// NOTE: Example.mmの「extern "C"」内で宣言した関数をここで呼び出す
        /// - iOSのプラグインは静的に実行ファイルにリンクされるので、`DllImport`にはライブラリ名として「__Internal」を指定する必要がある
        /// - `EntryPoint`に.mm側で宣言されている名前を渡すことでC#側のメソッド名は別名を指定可能
        [DllImport("__Internal", EntryPoint = "SpeakMessage")]
        static extern Int32 SpeakMessage(string message);


        #endregion P/Invoke

    }
}

