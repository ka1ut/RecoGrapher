import Foundation

class AuthViewModel: ObservableObject {
    @Published var model = AuthModel()

    func signInWithGoogle() {
        model.signInWithGoogle()
    }
}
