//
//  UniBookAppApp.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI
import Firebase

@main
struct UniBookAppApp: App {
    init() {
      FirebaseApp.configure()
    }
    var body: some Scene {
        var model = DataModel()
        WindowGroup {
            AdView(messageManager:model)
        }
    }
}
