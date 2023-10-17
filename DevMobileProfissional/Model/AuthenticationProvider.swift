import Foundation
import FirebaseAuth
import Firebase

struct AuthenticationProvider<Parameters, Credential> {
    let authenticate: (Parameters) async -> Credential
}

struct GoogleParams {
    let gmail: String
}

struct Token {
    let payload: String
}

struct AppleParams {
    let gmail: String
}

public struct DumbLoginParams {}

public struct EmailPasswordParams {
    
    // struct initializers are internal by default :(
    public init(email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        self.email = email
        self.password = password
        self.completion = completion
    }
    
    
    let email: String
    let password: String
    let completion: (AuthDataResult?, Error?) -> Void
}

struct PrivateKey {
    let data: Data
}

extension Auth {
    static func loginInAdapted(toParameters parameters: EmailPasswordParams) {
        Self.auth().signIn(
            withEmail: parameters.email,
            password: parameters.password,
            completion: parameters.completion)
    }
}

extension AuthenticationProvider where Parameters == EmailPasswordParams, Credential == Void {
    static func emailPassword(_ authenticator: @escaping (Parameters) -> Void = Auth.loginInAdapted) -> Self {
        .init { params in
            authenticator(params)
        }
    }
}

//extension AuthenticationProvider where Parameters == GoogleParams, Credential == Void {
//    static func google(_ googleAuthenticator: GAuthProvider = .shared) -> Self {
//        .init { parameters in
//
//        }
//    }
//}

struct emailUser {
    let credentials: User
}

public final class AuthenticationFacade {
    
    public static var shared: AuthenticationFacade = {
        let instance = AuthenticationFacade()
        
        return instance
    }()
    
    private init() {}
    
    public func authenticate(withEmail email: String,
                             withPassword password: String,
                             onSuccess successCompletion: @escaping () -> Void,
                             onError errorCompletion: @escaping () -> Void) async {
        
        let firebaseCompletion: (AuthDataResult?, Error?) -> Void = { (result, error) in
            if error != nil {
                print("Error on login with firebase auth Email and Password")
                print(error!.localizedDescription)
                errorCompletion()
                return
            } else {
                successCompletion()
            }
        }
        
        let params = EmailPasswordParams(email: email, password: password, completion: firebaseCompletion)
        
        let _ : () = await authenticate(using: .emailPassword(), params: params)
    }
    
//    func authenticate(_ params: GoogleParams) async {
//        let credentials = await authenticate(using: .google(), params: params)
//    }
    
    private func authenticate<T, U>(using authenticator: AuthenticationProvider<T, U>, params: T) async -> U {
        await authenticator.authenticate(params)

    }
}
