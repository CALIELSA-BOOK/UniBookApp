//
//  FBLoginView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-10-13.
//

import SwiftUI
import FBSDKLoginKit

struct FBLoginView: View {
    @AppStorage("logged") var logged = false
    @AppStorage("email") var email = ""
    @AppStorage("username") var username: String = "Anonymous"
    @AppStorage("facebookID") var id = ""
    @AppStorage("profilePic") var profilePic: String = ""
    @State var manager = LoginManager()
    
    @State private var isShowingDetails = false
    
    var body: some View{
        
        VStack(spacing: 25){
           // if (!logged){
            FBLog(logged: $logged, email: $email, username: $username, profilePic: $profilePic, id: $id)
                .frame(height: 50)
                .padding(.horizontal,35)
//            }else if(logged && ){
//                FBLog(logged: $logged, email: $email, username: $username, profilePic: $profilePic, id: $id)
//                    .frame(height: 50)
//                    .padding(.horizontal,35)
//            }else{
//                NavigationLink(destination: ContentView(), isActive: $isShowingDetails){
//                    Button("Let's go Hello")
//                        {
//                            self.isShowingDetails = true
//                        }
//                        .foregroundColor(.white)
//                        .padding(.all)
//                        .frame(width: 250, height: 50)
//                        .background(Color(red: 25/255, green: 85/255, blue: 166/255))
//                        .cornerRadius(16)
 //               }
            }

        }
    }


struct FBLoginView_Previews: PreviewProvider {
    static var previews: some View {
        FBLoginView()
    }
}



