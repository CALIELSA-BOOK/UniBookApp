//
//  LoginView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-26.
//

import SwiftUI
import FBSDKLoginKit

struct LoginView: View {
    var body: some View {
        Home()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct Home : View {
    
    @AppStorage("logged") var logged = false
    @AppStorage("email") var email = ""
    @State var manager = LoginManager()
    
    var body: some View{
        VStack(){
            FBLog(logged: $logged, email: $email)
                .frame(height: 50)
                .padding(.horizontal,35)
        VStack(spacing: 25){
            FBLog(logged: $logged, email: $email)
                .frame(height: 50)
                .padding(.horizontal,35)
            Text(email)
                .fontWeight(.bold)
        }
    }
    }
}

//native fb-login button
struct FBLog : UIViewRepresentable {
    func updateUIView(_ uiView: FBLoginButton, context: Context){
        FBLog.Coordinator(parent1: self)
    }
  
    func makeCoordinator() -> Coordinator {
        return FBLog.Coordinator(parent1: self)
    }
    
    @Binding var logged : Bool
    @Binding var email : String
    
//    @AppStorage("logged") var logged = false
//    @AppStorage("email") var email = ""
    
    func makeUIView(context: Context) -> FBLoginButton {
        let button = FBLoginButton()
        
        button.delegate = context.coordinator
        return button
    }
    
    class Coordinator : NSObject, LoginButtonDelegate{
        
        var parent : FBLog
        
        init(parent1 : FBLog){
            parent = parent1
        }
        
        func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if error != nil{
                print(error!.localizedDescription)
                return
            }
            
            if result!.isCancelled{
                parent.logged = true
                
                //getting user details
                let request = GraphRequest(graphPath: "me", parameters: ["fields": "email"])
                
                request.start { (_, res, _) in
                    //will return as dictionary
                    guard let profileData = res as? [String : Any] else{return}
                
                    self.parent.email = profileData["email"] as! String
                }
            }
        }
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            parent.logged = false
            parent.email = ""
        }
    }
}


