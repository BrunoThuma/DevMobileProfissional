import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authService:AuthService

    var body: some View{
        ZStack{
            if(!authService.signedIn){
                Button(action: {
                    self.authService.authenticate()
                }) {
                    Text("Login")
                        .padding([.leading,.trailing],30)
                        .padding([.top,.bottom],15)
                }
                .foregroundColor(.white)
                .background(Color(.blue))
                .cornerRadius(3)
            }
            else{
                TabBarView()
            }
        }
    }
}

// MARK:- Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
