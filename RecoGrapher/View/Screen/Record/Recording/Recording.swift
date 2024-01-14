import SwiftUI

struct RecordingPage: View {
    @State private var showingCamera = false
    @State private var image: UIImage?
    @State var showCapturedImage = false
    
    @Environment(\.dismiss) private var dismiss
    @State var inputText = ""
    
    @ObservedObject private var recordingViewModel = RecordingViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.customBlack)
                })
                
                Spacer()
                
                Text("Recording")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.customBlack)
                
                Spacer()
                
                Button(action: {
                }, label: {
                    Image(systemName: "ellipsis")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20)
                        .foregroundColor(Color.customBlack)
                })
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            
            ZStack{
                // 背景
                VStack() {
                    Button(action:{
                        recordingViewModel.onTaped()
                    },label:{
                        Image(systemName: recordingViewModel.isRecognition ? "mic.slash.circle" : "mic.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .foregroundColor(recordingViewModel.isRecognition ? .red : .primary)
                    })
                    
                    // 他のテキストやビューのコンテンツ
                }
                .padding()
            }
        }
        VStack{
            
            Spacer()
            
        }
        .padding()
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
        .background(Color.customWhite)
    }
}
    
    
#Preview {
    RecordingPage()
}
