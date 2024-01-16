import SwiftUI

struct RecordPage: View {
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
                        
                        HStack{
                            ZStack{
                                Button(action:{
                                    recordingViewModel.onTaped()
                                },label:{
                                    ZStack{
                                        Rectangle()
                                            .fill(.red)
                                            .frame(width: recordingViewModel.isRecognition ? 35 : 55, height: recordingViewModel.isRecognition ? 35 : 55)
                                            .cornerRadius(recordingViewModel.isRecognition ? 5 : 35)
                                    }
                                })
                                Circle()
                                    .stroke(Color.gray, lineWidth: 4)
                                    .frame(width: 65, height: 65)
                            }
                        }
                    }
                    
                }
            }
            .background(Color.customWhite)
        }
    }
}

#Preview {
    RecordPage()
}
