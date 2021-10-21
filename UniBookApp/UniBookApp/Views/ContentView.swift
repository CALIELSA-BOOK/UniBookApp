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
    @ObservedObject var homeViewModel: HomeViewModel
    @ObservedObject var searchViewModel: SearchViewModel
    @State var loadData: Bool = false

    var body: some View {

        if (!logged) {
                StartPageView()
        }else{
            VStack{
                TabView {
                    NavigationView {
                        HomeView(homeViewModel: homeViewModel)
                                 .navigationBarTitle("Welcome")
                         
                     }.onAppear(perform:{
                         homeViewModel.getBooks()
                         let seconds = 4.0
                         DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                         homeViewModel.getRandomBooks()
                         homeViewModel.filterUniqueBooks()
                         }
                     }).onDisappear(perform: {
                         homeViewModel.bookResult.removeAll()
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
