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
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
      FirebaseApp.configure()
    }
    
    var body: some Scene {
        let dataModel = DataModel()
        let adViewModel = CreateAdViewModel(model: dataModel)
        let searchViewModel = SearchViewModel(model: dataModel)
        let homeViewModel = HomeViewModel(model: dataModel)
        WindowGroup {
            ContentView(adViewModel: adViewModel, searchViewModel: searchViewModel, homeViewModel: homeViewModel)
                    }
                }
            }

