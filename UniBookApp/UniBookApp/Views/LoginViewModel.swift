//
//  FBLoginViewModel.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-10-19.
//

import SwiftUI
import FBSDKLoginKit

//native fb-login button
struct FBLog : UIViewRepresentable {
    
    func updateUIView(_ uiView: FBLoginButton, context: Context){}
  
    func makeCoordinator() -> Coordinator {
        return FBLog.Coordinator(parent1: self)
    }
    
    @Binding var logged : Bool
    @Binding var email : String
    @Binding var username : String
    @Binding var profilePic : String
    @Binding var id : String
    
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
            let token = result?.token?.tokenString
            
            //getting user details
            let request = GraphRequest(graphPath: "me", parameters: ["fields": "name, email, picture"],
                                       tokenString: token,
                                       version: nil,
                                       httpMethod: .get)
            
            request.start( completion: { connection, result, error in
                guard let profileData = result as? [String : Any] else{return}
                self.parent.username = profileData["name"] as! String
                self.parent.id = profileData["id"] as! String
                if let imageURL = ((profileData["picture"] as? [String: Any])?["data"] as? [String: Any])?["url"] as? String {
                    self.parent.profilePic = imageURL
                    }
                self.parent.logged = true
            })
            if error != nil{
                print(error!.localizedDescription)
                return
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            //manager.logOut()
            parent.logged = false
            parent.email = ""
            parent.username = ""
            parent.profilePic = ""
            parent.id = ""
        }
    }
}
