//
//  ISBNSearchViewModel.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-05.
//
import Foundation
import SwiftUI
import Combine

class CreateAdViewModel: Identifiable, ObservableObject{
    @ObservedObject private var dataModel: DataModel
    @Published var searchTerm: String = ""
    @Published public var books: [ISBNBookViewModel] = []
    @Published public var booksForAd: [Book] = []
    @Published var images: [UIImage] = []
    @Published var image: UIImage?
    @Published var isbnView: Bool?
    private let isbnSource: ISBNSource = ISBNSource()
    private var disposables = Set<AnyCancellable>()

    init(model: DataModel){
        self.dataModel = model
        $searchTerm
          .sink(receiveValue: loadBook(searchTerm:))
          .store(in: &disposables)
    }
    
    public func setSearchTerm(sTerm: String){
        self.searchTerm = sTerm
    }

    public func emptyArrays(){
        self.books.removeAll()
        self.booksForAd.removeAll()
        self.images.removeAll()
        dataModel.booksForSale.removeAll()
    }
    
    public func GetBooksForSale(){
        self.dataModel.GetBooksForSale()
    }
    
    public func convertAPIToBook(isbn: String){
        let uID = UUID().uuidString
        let tempAuthors = self.books[0].authors.joined(separator: ", ")
        let bookToAdd = Book(id: uID, name: self.books[0].title,
                             authors: tempAuthors,
                             isbn: isbn,
                             bookCover: "closed"
        )
        self.booksForAd.append(bookToAdd)
        self.books.removeAll()
    }
    
    public func CreateAd(price: String, bookComment: String, condition: String){
        self.booksForAd[0].price = price
        self.booksForAd[0].comment = bookComment
        self.booksForAd[0].condition = condition
        self.dataModel.SaveBookInfo(book: self.booksForAd[0])
        
            images.forEach({ image in
                self.saveImage(image: image, id: booksForAd[0].id)
            })
        self.emptyArrays();
        self.GetBooksForSale()
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
    public func saveImage(image: UIImage,id:String){
        dataModel.SaveImage(image: image, id: id)
    }
    public func deleteBook(id: String){
        dataModel.deleteBook(id: id)
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

class ViewBool: ObservableObject {
    @Published var viewBool = false;
}
