import AVFoundation
import Foundation
import UIKit
public class staticLibrary_swift : NSObject {

    public static var speechSynthesizer: AVSpeechSynthesizer!
    /// ログに"Hello World"と出力して2を返す。
    /// NOTE: ここではクラスメソッド(静的関数)として実装
    ///
    /// - Returns: 2固定
    @objc public static func SpeakMessage(message : String) -> Int32 {
        // ログ出力
        print("音声読み上げ開始")
        print(message)
        // AVSpeechSynthesizerのインスタンス作成
        speechSynthesizer = AVSpeechSynthesizer()
        // 読み上げる、文字、言語などの設定
        let utterance = AVSpeechUtterance(string: message) // 読み上げる文字
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP") // 言語 英語は en-US
        utterance.rate = 0.5 // 読み上げ速度
        utterance.pitchMultiplier = 1.0 // 読み上げる声のピッチ
        utterance.preUtteranceDelay = 0.2 // 読み上げるまでのため
        speechSynthesizer.speak(utterance)
        
        // 戻り値を返す
        return 2
    }
}

