//
//  ContentView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI 

struct ContentView: View {
    @AppStorage("logged") var logged = false
    @ObservedObject var adViewModel: CreateAdViewModel
    @ObservedObject var searchViewModel: SearchViewModel
    @State var loadData: Bool = false
  
    var body: some View {

        if (!logged) {
                StartPageView()
        }else{
            VStack{
                TabView {
                   NavigationView {
                        HomeView()
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
                        SearchView(searchViewModel: searchViewModel, adViewModel: adViewModel)
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
                        ProfileView(searchViewModel: searchViewModel, adViewModel: adViewModel)
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
