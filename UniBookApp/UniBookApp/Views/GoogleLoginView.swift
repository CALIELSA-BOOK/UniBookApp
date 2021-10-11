////
///
///NOTE USED AT THE MOMENT!!!!!!!!
///
///
///
////  GoogleLoginView.swift
////  UniBookApp
////
////  Created by Sara Damne on 2021-09-27.
////
//
//import SwiftUI
//import GoogleSignIn
//
//struct GoogleLoginView: View {
//    var body: some View {
//
//        VStack(){
//            GoogleSignInButton()
//                .frame(height: 50)
//                .padding(.horizontal,35)
//    //            .onTapGesture {
//    //                SocialLogin().attemptLoginGoogle()
//    //    }
//        }
//}
//
//struct GoogleLoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoogleLoginView()
//    }
//}
//
//struct GoogleSignInButton: UIViewRepresentable {
//    func makeUIView(context: Context) -> GIDSignInButton {
//        return GIDSignInButton()
//    }
//
//    func updateUIView(_ uiView: GIDSignInButton, context: Context) {
//    }
//
//}
//
////    func signIn(sender: Any) {
////      GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting: self) { user, error in
////        guard error == nil else { return }
////
////        // If sign in succeeded, display the app's main content View.
////      }
////    }
//
// //Sign-In flow UI of the provider
//    struct SocialLogin: UIViewRepresentable {
//
//        func makeUIView(context: UIViewRepresentableContext<SocialLogin>) -> UIView {
//            return UIView()
//        }
//
//        func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<SocialLogin>) {
//        }
//
//        func attemptLoginGoogle() {
//              GIDSignIn.sharedInstance.signIn(with: <#T##GIDConfiguration#>, presenting: <#T##UIViewController#>) { user, error in
//                guard error == nil else { return }
//
//                // If sign in succeeded, display the app's main content View.
//              }
//        }
//
//    }
//}
