//
//  SearchView.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-19.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @ObservedObject var adViewModel: CreateAdViewModel
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                SearchBar(searchTerm: $searchViewModel.searchTerm)
                if searchViewModel.bookResult.isEmpty{
                    if searchViewModel.isLoading.isLoading == .noresult{
                        Text("No result")
                        Spacer()
                    }
                    EmptyStateView()
                }
                else{
                    ScrollView(.vertical){
                        VStack(spacing: 25){
                           
                            ForEach(searchViewModel.bookResult, id: \.self) {book in
                                NavigationLink(destination: DisplayAdView(adViewModel: adViewModel, searchViewModel: searchViewModel, book: book)){
                                    BookItemView(booktitle: book.name, bookauthor: book.authors, bookISBN: book.isbn, bookPrice: book.price!).padding(.bottom,geometry.size.height * 0.10)
                                Spacer()
                            
                            }.buttonStyle(PlainButtonStyle())
                        }
                        
                    }
                }
            }
        }
    }
    }
}

