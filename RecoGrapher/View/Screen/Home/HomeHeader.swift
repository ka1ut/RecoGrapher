import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack {
            Text("RecoGrapher")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color.customBlack)

            Spacer()

            NavigationLink(destination: Search()) {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.customBlack)
            }
            .padding(.horizontal, 10)

            NavigationLink(destination: Account()) {
                Image(systemName: "person")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(Color.customBlack)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(15)
    }
}

#Preview {
    HomeHeaderView()
}
