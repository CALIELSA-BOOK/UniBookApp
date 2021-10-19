//
//  SearchView.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-19.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Text("Enter ISBN")
                SearchBar(searchTerm: $searchViewModel.searchTerm)
                
                if searchViewModel.bookResult.isEmpty{EmptyStateView()}
                
                else{
                    ScrollView(.vertical){
                        VStack(spacing: 15){
                            ForEach( searchViewModel.bookResult, id: \.self) {book in
                                BookItemView(booktitle: book.name, bookauthor: book.authors, bookISBN: book.isbn, bookPrice: 10)
                                    .padding(.bottom,geometry.size.height * 0.10)
                                Spacer()
                            }
                        }
                        
                    }
                }
            }
        }
    }
}
