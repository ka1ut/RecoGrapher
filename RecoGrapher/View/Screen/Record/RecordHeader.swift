import SwiftUI

struct RecordHeaderView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack{
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
            }
        }
}

#Preview {
    RecordHeaderView()
}
