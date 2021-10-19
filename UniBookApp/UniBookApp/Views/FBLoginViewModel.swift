//
//  FBLoginViewModel.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-10-15.
//

import Foundation
import SwiftUI
import FBSDKLoginKit


class FBLoginViewModel: Identifiable, ObservableObject{
    var logged : Bool
    var email : String
    var name : String
    
    init(){
        logged = false
        email = ""
        name = ""
    }
}

//native fb-login button
struct FBLog : UIViewRepresentable {
    @ObservedObject var user: FBLoginViewModel
    @State var manager = LoginManager()
    
    func updateUIView(_ uiView: FBLoginButton, context: Context){
        FBLog.Coordinator(parent1: self)
    }
  
    func makeCoordinator() -> Coordinator {
        return FBLog.Coordinator(parent1: self)
    }
    
    @Binding var logged : Bool
    @Binding var email : String
    @Binding var name : String
    
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
                let request = GraphRequest(graphPath: "me", parameters: ["fields": "email, name"])
                
                request.start { (_, res, _) in
                    //will return as dictionary
                    guard let profileData = res as? [String : Any] else{return}
                
                    self.parent.email = profileData["email"] as! String
                    self.parent.name = profileData["name"] as! String
                }
            }
        }
        
        func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
            parent.logged = false
            parent.email = ""
            parent.name = ""
        }
    }
}
