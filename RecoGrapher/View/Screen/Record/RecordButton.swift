import SwiftUI

struct RecordButton: View {
    @State var WriteView = false

    var body: some View {
        Button(action: {
                WriteView.toggle()
            }) {
                Image(systemName: "waveform")
                    .foregroundColor(.white)
                    .font(.system(size: 26))
                    .frame(width: 70, height: 70)
                    .background(Color.customBlack)
                    .cornerRadius(20.0)
                    .shadow(color: .gray, radius: 3, x: 0, y: 3)
                    
            }
            .fullScreenCover(isPresented: $WriteView, content: {
                WritePage()
            })
        }
        
}

#Preview {
    RecordButton()
}
