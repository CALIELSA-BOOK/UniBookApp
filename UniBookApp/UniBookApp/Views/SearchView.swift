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
                Text("Enter ISBN")
                SearchBar(searchTerm: $searchViewModel.searchTerm)
                if searchViewModel.bookResult.isEmpty{EmptyStateView()}
                else{
                    ScrollView(.vertical){
                        VStack(spacing: 25){
                           
                            ForEach(searchViewModel.bookResult, id: \.self) {book in
                                NavigationLink(destination: DisplayAdView(adViewModel: adViewModel, book: book)){
                                    BookItemView(booktitle: book.name, bookauthor: book.authors, bookISBN: book.isbn, bookPrice: 10).padding(.bottom,geometry.size.height * 0.10)
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
