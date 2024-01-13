import SwiftUI

struct Home: View {
    @State var selection = 1

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    HomeHeaderView()
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        RecordButton()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 26.0, trailing: 25.0))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            }
        }
    }
}

#Preview {
    Home()
}
