//
//  ISBNSearchViewModel.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-05.
//
import Foundation
import SwiftUI
import Combine

class ISBNBookListViewModel: Identifiable, ObservableObject{
    @Published var searchTerm: String = ""
    @Published public private(set) var books: [ISBNBookViewModel] = []
    private let isbnSource: ISBNSource = ISBNSource()
    private var disposables = Set<AnyCancellable>()

    init(){
        $searchTerm
          .sink(receiveValue: loadBook(searchTerm:))
          .store(in: &disposables)
    }
 
    private func loadBook(searchTerm: String) {
      books.removeAll()
        isbnSource.getBookInfo(isbn: searchTerm) {book in
              DispatchQueue.main.async {
                  let isbnBookViewModel = ISBNBookViewModel(isbnData: book)
                  self.books.append(isbnBookViewModel)
              }
        }
    }
}

class ISBNBookViewModel: Identifiable, ObservableObject{
    var id: String
    var title: String
    var authors: [String]
    var publishedDate:String
    var language: String
    
    init(isbnData: ISBNData){
        self.id = isbnData.items[0].id
        self.title = isbnData.items[0].volumeInfo.title
        self.authors = isbnData.items[0].volumeInfo.authors
        self.publishedDate = isbnData.items[0].volumeInfo.publishedDate
        self.language = isbnData.items[0].volumeInfo.language
    }
}

/*Test in ContentView
 @ObservedObject var viewModel: ISBNBookListViewModel
 
 Inside view:
 SearchBar(searchTerm: $viewModel.searchTerm)
 if viewModel.books.isEmpty {
   EmptyStateView()
 } else {
     ISBNSearchView(tempBook: viewModel.books[0])
 }
 */
