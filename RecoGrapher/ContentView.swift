import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    var speechRecorder = SpeechRecognitionEngine()
    
    var body: some View {
        ZStack {
            Home()
                .onAppear {
                    requestSpeechAuthorization()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("アクセス権限が必要"),
                        message: Text("設定画面よりアクセス権限を設定してください。"),
                        dismissButton: .default(Text("設定を開く"), action: {
                            // アプリの設定ページを開く
                            if let url = URL(string: UIApplication.openSettingsURLString),
                               UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                            }
                        })
                    )
                }
        }
    }

    private func requestSpeechAuthorization() {
        if !speechRecorder.authorization() {
            // マイク認識要求
            speechRecorder.requestAccess() {
                if speechRecorder.authorization() {
                    // 正常時処理
                    print("Authorization OK")
                } else {
                    // 異常時処理
                    print("Authorization NG")
                    DispatchQueue.main.async {
                        // アラートを表示するための状態を更新
                        showingAlert = true
                    }
                }
            }
        }
        
        
    }
}


#Preview {
    ContentView()
}
