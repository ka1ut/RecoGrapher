import SwiftUI

struct RecordingPage: View {
    @State private var showingCamera = false
    @State private var image: UIImage?
    @State var showCapturedImage = false
    
    @Environment(\.dismiss) private var dismiss
    @State var inputText = ""
    
    @ObservedObject private var recordingViewModel = RecordingViewModel()
    
    var body: some View {
        GeometryReader { geometryProxy in

                VStack {
                    RecordHeaderView()
                    
                    ZStack{
                        VStack() {
                            ScrollView(.vertical){
                                LazyVStack{
                                    Image("person")
                                    Image("person")
                                }
                            }
                            
                            
                            Spacer()
                            
                            Button(action:{
                                recordingViewModel.onTaped()
                            },label:{
                                Image(systemName: recordingViewModel.isRecognition ? "mic.slash.circle" : "mic.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(recordingViewModel.isRecognition ? .red : .primary)
                            })
                        }
                        
                    }
                }
                VStack{
                    
                    Spacer()
                    
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
                .background(Color.customWhite)
            }
    }
}

#Preview {
    RecordingPage()
}
