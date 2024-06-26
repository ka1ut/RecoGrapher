import SwiftUI
import Speech

class RecordingViewModel : ObservableObject{
    /// 音声認識クラス
    lazy var speechRecorder = SpeechRecognitionEngine(language: "JP",silenceTime:3
                                                      ,onFinishTask:onFinishTask
                                                      ,onRecognition:onRecognition)
    /// 認識中
    @Published var text = ""
    /// 認識結果
    @Published var result = ""
    /// 認識中か否か
    @Published var isRecognition = false
    
    
    /// マイクボタンタップ時
    func onTaped(){
        DispatchQueue.main.async {
            // テキストクリア
            self.text = ""
            self.result = ""

            if self.isRecognition {
                // 音声認識停止
                self.speechRecorder.stopRecording()
            } else {
                // 音声認識開始
                try? self.speechRecorder.startRecording()
            }

            // 認識フラグ設定
            self.isRecognition.toggle()
        }
    }
    
    /// 音声認識時
    /// - Parameter strings: 認識した文字列
    func onRecognition(strings:[String]){
        print("\n認識開始:" + strings.debugDescription)
        
        // 文字列設定
        DispatchQueue.main.async {
            let text = strings.joined(separator: "")
            if self.text != text {
                self.text = text
            }
        }
    }
    
    /// 認識結果
    func onFinishTask(){
        DispatchQueue.main.async {
            self.result = self.text
            self.text = ""
            
            // 音声認識停止
            self.speechRecorder.stopRecording()
            self.isRecognition = false
        }
    }
}
