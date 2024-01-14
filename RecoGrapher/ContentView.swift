import SwiftUI
import Speech

struct ContentView: View {
    var body: some View {
        ZStack {
            Home()
                .onAppear {
                    requestSpeechAuthorization()
                }
        }
    }
    private func requestSpeechAuthorization() {
        SFSpeechRecognizer.requestAuthorization { authStatus in
            switch authStatus {
            case .authorized:
                print("音声認識へのアクセスが許可されました。")
            case .denied:
                print("音声認識へのアクセスが拒否されました。")
            case .restricted:
                print("このデバイスでは音声認識が制限されています。")
            case .notDetermined:
                print("音声認識へのアクセスがまだ決定されていません。")
            @unknown default:
                print("未知の認証ステータス")
            }
        }
    }
}

#Preview {
    ContentView()
}
