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
    @ObservedObject var isLoading: LoadingStatus
    
    var body: some View {
        VStack{
           Text("Enter your books ISBN")
            SearchBar(searchTerm: $adViewModel.searchTerm)
            if adViewModel.books.isEmpty{
                if isLoading.isLoading == .loading{
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .gray)).scaleEffect(2)
                }
                if isLoading.isLoading == .noresult{
                    Text("No result")
                }
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
            Text("Title: " + adViewModel.books[0].title).font(.system(size: 26, weight: .medium, design: .default))
            Text("Published date: " + adViewModel.books[0].publishedDate).font(.system(size: 16, weight: .light, design: .default))
            Text("Authors: ")
            ForEach(adViewModel.books[0].authors, id: \.self) { author in
                           Text(author)
                       }.font(.system(size: 16, weight: .light, design: .default))
            Text("Language: " + adViewModel.books[0].language).font(.system(size: 16, weight: .light, design: .default))
            Spacer()
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
