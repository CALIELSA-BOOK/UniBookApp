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
        let model = DataModel()
        let adViewModel =  CreateAdViewModel(model: model)
        WindowGroup {
            ContentView(adViewModel: adViewModel)
        }
    }
}
