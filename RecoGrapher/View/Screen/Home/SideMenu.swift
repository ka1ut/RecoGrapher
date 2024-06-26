import SwiftUI

struct SideMenuView: View {
    @Binding var isOpen: Bool
    let width = UIScreen.main.bounds.width * 0.85

    var body: some View {
        ZStack {
            GeometryReader { geometry in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .opacity(1.0)
            .animation(.easeIn(duration: 0.15))
            .onTapGesture {
                self.isOpen = false
            }
            
            HStack {
                VStack() {
                    SideMenuContentView(topPadding: 100, systemName: "person", text: "Profile", isOpen: $isOpen)
                    SideMenuContentView(systemName: "trash", text: "Trash", isOpen: $isOpen)
                    SideMenuContentView(systemName: "gearshape", text: "Setting", isOpen: $isOpen)
                    Spacer()
                }
                .frame(width: width)
                .background(Color.customWhite)
                .offset(x: self.isOpen ? 0 : -self.width)
                .animation(.easeIn(duration: 0.15))
                Spacer()
            }
        }
    }
}

struct SideMenuContentView: View {
    let topPadding: CGFloat
    let systemName: String
    let text: String
    @Binding var isOpen: Bool
    
    init(topPadding: CGFloat = 30, systemName: String, text: String, isOpen: Binding<Bool>) {
        self.topPadding = topPadding
        self.systemName = systemName
        self._isOpen = isOpen
        self.text = text
    }
    
    var body: some View {
        HStack {
            Image(systemName: systemName)
                .foregroundColor(.customBlack)
                .imageScale(.large)
                .frame(width: 32.0)
            Text(text)
                .foregroundColor(Color.customBlack)
                .font(.headline)
            Spacer()
        }
        .padding(.top, topPadding)
        .padding(.leading, 32)
        .onTapGesture {
            self.isOpen = false
        }
    }
}
