import FirebaseAuth
import FirebaseCore
import Foundation
import GoogleSignIn

class AuthModel: ObservableObject {
    @Published var isAuthenticated = false

    func signInWithGoogle() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)

        GIDSignIn.sharedInstance.configuration = config

        let windowScene: UIWindowScene? = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let rootViewController: UIViewController? = windowScene?.windows.first!.rootViewController!

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController!) { [unowned self] result, error in
            if let error {
                print("GIDSignInError: \(error.localizedDescription)")
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)

            Auth.auth().signIn(with: credential) { (authResult, error) in
                if let error {
                    // サインインに失敗した場合
                    // エラーハンドリング
                    print(error.localizedDescription)
                } else {
                    self.isAuthenticated = true
                }
            }
        }
    }
}
