//
//  ContentView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI
import FBSDKLoginKit

struct ContentView: View {
    
    var body: some View {

        if (!UserDefaults.standard.bool(forKey: "logged")) {
            NavigationView{
                StartPageView()
            }
        }else{
            VStack{
                TabView {
                    NavigationView {
                        HomeView()
                            .navigationBarTitle("Welcome")
                    }
                        .tabItem {
                            Label("Home", systemImage: "homekit")
                    }
                    NavigationView {
                        Text("Search")
                            .navigationTitle("Search")
                    }
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                    }
                    NavigationView {
                        ScrollView {
                            AdView()
                        }
                    }
                        .tabItem {
                            Label("Add", systemImage: "plus")
                    }
                    NavigationView {
                        ProfileView()
                            .navigationTitle("Profile")
                    }
                        .tabItem {
                            Label("Profile", systemImage: "person.crop.circle")
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
