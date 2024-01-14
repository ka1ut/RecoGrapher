import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

struct SignUp: View {
    @StateObject private var authViewModel = AuthViewModel()

    var body: some View {
        VStack {
            if authViewModel.model.isAuthenticated {
                Text("認証完了")
            } else {
                GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal), action: authViewModel.signInWithGoogle).padding()
            }
        }
    }
}

#Preview {
    SignUp()
}
