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
    @ObservedObject var homeViewModel: HomeViewModel
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
                                            if(homeViewModel.start=="start"){
                                            let seconds = 3.0
                                            DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                            homeViewModel.getRandomBooks()
                                            homeViewModel.filterUniqueBooks()
                                            }
                                            } else {
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
