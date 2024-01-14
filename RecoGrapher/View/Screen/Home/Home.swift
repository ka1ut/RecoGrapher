import SwiftUI

struct Home: View {
    @State var selection = 1
    @State var isOpenSideMenu: Bool = false

    var body: some View {
        // GeometryReader は親の位置
        GeometryReader { geometry in
            ZStack{
                VStack {
                    HomeHeaderView(isOpenSideMenu:$isOpenSideMenu)
            
                    Spacer()
                    
                    HStack {
                        Spacer()
                        RecordButton()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 26.0, trailing: 25.0))
                    }
                }
                SideMenuView(isOpen: $isOpenSideMenu)
                                .edgesIgnoringSafeArea(.all)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
    }
    
}

#Preview {
    Home()
}
