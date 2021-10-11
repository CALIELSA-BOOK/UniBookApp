//
//  UniBookAppApp.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI
import GoogleSignIn

@main
struct UniBookAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let signInConfig = GIDConfiguration.init(clientID: "322940052146-r9mh2r4svrod448hsunv8q6ut0vqg2kq.apps.googleusercontent.com")
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}

