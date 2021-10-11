//
//
//// Swift
////
//// AppDelegate.swift

import UIKit
import FBSDKCoreKit
import GoogleSignIn

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
          
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )

        return true
    }
          
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {

        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
    }
    
//         *** Google Stuff - not in use ***

//  Persistence for Google
//    func GoogleApplication(
//      _ application: UIApplication,
//      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//    ) -> Bool {
//      GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
//        if error != nil || user == nil {
//          // Show the app's signed-out state.
//        } else {
//          // Show the app's signed-in state.
//        }
//      }
//      return true
//    }
//    func GoogleApplication(
//      _ application: UIApplication,
//      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
//    ) -> Bool {
//      GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
//        if error != nil || user == nil {
//          // Show the app's signed-out state.
//        } else {
//          // Show the app's signed-in state.
//        }
//      }
//      return true
//    }
}
