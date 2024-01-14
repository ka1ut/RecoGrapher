import SwiftUI

struct HomeHeaderView: View {
    @Binding var isOpenSideMenu: Bool
    
    var body: some View {
        ZStack{
            HStack {
                Button(action:{
                    self.isOpenSideMenu.toggle()
                }){
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 20)
                        .foregroundColor(Color.customBlack)
                }

                Spacer()
                
                Text("RecoGrapher")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.customBlack)

                Spacer()

                NavigationLink(destination: Search()) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.customBlack)
                }

                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(15)
            }
        }
}

struct HomeHeaderPreviewModel: View{
    @State private var isOpenSideMenu = false
    var body:some View{
        HomeHeaderView(isOpenSideMenu:$isOpenSideMenu)
    }
    
}

#Preview {
    HomeHeaderPreviewModel()
}
