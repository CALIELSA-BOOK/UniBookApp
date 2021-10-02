//
//  ContentView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            TabView {
                Text("Home")
                    .tabItem {
                        Label("Home", systemImage: "homekit")
                }
                Text("Search")
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                }
                NavigationView {
                    AdView()
                        .navigationBarTitle("Sell Book")
                }
                    .tabItem {
                        Label("Add", systemImage: "plus")
                }
                Text("Profile")
                    .tabItem {
                        Label("Profile", systemImage: "person.crop.circle")
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
