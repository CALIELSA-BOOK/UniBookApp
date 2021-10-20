//
//  UniBookAppApp.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI

@main
struct UniBookAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
                ContentView()
        }
    }
}
