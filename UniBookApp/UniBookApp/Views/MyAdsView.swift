//
//  SearchView.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-19.
//

import SwiftUI

struct MyAdsView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                if searchViewModel.userBookResult.isEmpty{
                    VStack{
                        Spacer()
                        Text("No ads found").padding(.leading, UIScreen.main.bounds.width/2.5)
                        
                    }
                    EmptyStateView()
                }
                else{
                    
                    if #available(iOS 15.0, *) {
                        List(searchViewModel.userBookResult) { book in
                            NavigationLink(destination: DisplayMyAdView(searchViewModel:searchViewModel, book: book)){
                                Image(systemName: "book.closed") //image
                                    .renderingMode(.original)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: geometry.size.width * 0.1)
                                VStack(alignment: .leading){
                                    Text(book.name)
                                    //Text(book.authors)
                                }
                                
                                
                            }.padding(.bottom,geometry.size.height * 0.01).buttonStyle(PlainButtonStyle())
                        }.refreshable(action:{
                            searchViewModel.refreshBook()
                        })
                    } else {
                        // Fallback on earlier versions
                    }
                }
            }.navigationTitle("My ads")
        }
    }
}
