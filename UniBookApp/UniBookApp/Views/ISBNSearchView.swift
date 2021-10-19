//
//  ISBNSearchView.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-02.
//

import SwiftUI
struct ISBNSearchView: View {
    @ObservedObject var adViewModel: CreateAdViewModel
    @ObservedObject var viewBool: ViewBool
    
    var body: some View {
        VStack{
           Text("Enter your books ISBN")
            SearchBar(searchTerm: $adViewModel.searchTerm)
            if adViewModel.books.isEmpty{
                EmptyStateView()
            }
            else {ISBNSearchResultView(adViewModel: adViewModel,viewBool: viewBool, isbnFinal: adViewModel.searchTerm)
            }
        }
    }
}

struct ISBNSearchResultView: View {
    @ObservedObject var adViewModel: CreateAdViewModel
    @ObservedObject var viewBool: ViewBool
    @State var isbnFinal: String = ""
   
    var body: some View {
        if adViewModel.books.isEmpty{EmptyStateView()}
        else{
        VStack{
            Text("Title: " + adViewModel.books[0].title)
            Text("Published date: " + adViewModel.books[0].publishedDate)
            Text("Authors: ")
            ForEach(adViewModel.books[0].authors, id: \.self) { author in
                           Text(author)
                       }
            Text("Language: " + adViewModel.books[0].language)
            Button("Add to ad") {
                adViewModel.convertAPIToBook(isbn: isbnFinal)
                self.viewBool.viewBool = false
            }
            .foregroundColor(.white)
            .padding(.all)
            .frame(width: 250, height: 50)
            .background(Color(red: 25/255, green: 85/255, blue: 166/255))
            .cornerRadius(16)
        }
        }
    }
    
}


/*struct ISBNSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ISBNSearchView()
    }
}
*/
