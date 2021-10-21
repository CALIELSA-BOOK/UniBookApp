//
//  ProfileView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-12.
//

import SwiftUI

struct ProfileView: View {
    @State private var isShowingDetails = false
    @ObservedObject var searchViewModel: SearchViewModel
    @ObservedObject var adViewModel: CreateAdViewModel
    var body: some View {
        VStack{
            List{
                HStack{
                    if #available(iOS 15.0, *) {
                        AsyncImage(url: URL(string: UserDefaults.standard.string(forKey: "profilePic") ?? "https://robohash.org/hello" ))
                            .frame(width: 100, height: 100)
                    } else {
                        // Fallback on earlier versions
                    }
                    Text(UserDefaults.standard.string(forKey: "username") ?? "Anonymous")
                        .font(.largeTitle)
                }
                NavigationLink(destination: MyAdsView(searchViewModel: searchViewModel).onAppear(perform: {
                    if searchViewModel.userBookResult.isEmpty{
                        searchViewModel.findUserBooks(seller: UserDefaults.standard.string(forKey: "facebookID")!)
                    }
                })){
                    Text("My Ads")
                }
            }
            
            FBLoginView()
            
        }
    }
}
