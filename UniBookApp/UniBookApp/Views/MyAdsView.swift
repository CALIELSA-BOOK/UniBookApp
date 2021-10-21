//
//  SearchView.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-19.
//

import SwiftUI

struct MyAdsView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @ObservedObject var adViewModel: CreateAdViewModel
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                if searchViewModel.userBookResult.isEmpty{EmptyStateView()}
                else{
                    ScrollView(.vertical){
                        VStack(spacing: 25){
                           
                            ForEach(searchViewModel.userBookResult, id: \.self) {book in
                                NavigationLink(destination: DisplayAdView(adViewModel: adViewModel, searchViewModel: searchViewModel, book: book)){
                                    BookItemView(booktitle: book.name, bookauthor: book.authors, bookISBN: book.isbn, bookPrice: book.price!).padding(.bottom,geometry.size.height * 0.10)
                                Spacer()
                            
                            }.buttonStyle(PlainButtonStyle())
                        }
                        
                    }
                }
            }
        }.navigationTitle("My ads")
    }
    }
}
