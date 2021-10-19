//
//  ContentView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI
import FBSDKLoginKit

struct ContentView: View {
    @ObservedObject var adViewModel: CreateAdViewModel
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var searchViewModel: SearchViewModel
    @State var loadData: Bool = false
    var body: some View {

        if (!UserDefaults.standard.bool(forKey: "logged")) {
            NavigationView{
                StartPageView()
            }
        }else{
            VStack{
                TabView {
                    NavigationView {
                        HomeView(homeViewModel: homeViewModel)
                            .navigationBarTitle("Welcome")
                    }.onAppear(perform:{
                        if self.loadData == false{
                            adViewModel.GetBooksForSale()
                            self.loadData = true
                        }
                    })
                        .tabItem {
                            Label("Home", systemImage: "homekit")
                        }
                    NavigationView {
                        SearchView(searchViewModel: searchViewModel)
                            .navigationTitle("Search")
                    }.onDisappear(perform: {searchViewModel.emptyArray()})
                        .tabItem {
                            Label("Search", systemImage: "magnifyingglass")
                        }
                    NavigationView {
                        ScrollView {
                            CreateAdView(adViewModel: adViewModel)
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

/*struct ContentView_Previews: PreviewProvider {
 static var previews: some View {
 ContentView()
 }
 }*/
