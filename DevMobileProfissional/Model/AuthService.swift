import Foundation

class AuthService : ObservableObject {
    
    @Published var signedIn:Bool
    private var uid:String? = nil
    
    init(signedIn:Bool) {
        self.signedIn = signedIn
    }
    
    func authenticate() {
        self.signedIn = true
        self.uid = "USERIDSET"
    }
    
    func getUid() -> String? {
        if(self.signedIn){
            return self.uid
        }
        else{
            return nil
        }
    }
    
    func signOut(){
        self.signedIn = false
        self.uid = nil
    }
}
