//
//  ISBNSearchViewModel.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-05.
//
import Foundation
import SwiftUI
import Combine

class SearchViewModel: Identifiable, ObservableObject{
    @ObservedObject private var dataModel: DataModel
    @Published var searchTerm: String = ""
    @Published public var bookResult: [Book] = []
    
    @Published var isbnView: Bool?
    private var disposables = Set<AnyCancellable>()
    
    init(model: DataModel){
        self.dataModel = model
        $searchTerm
            .sink(receiveValue: findISBNBooks(isbn:))
            .store(in: &disposables)
    }
    
    public func setSearchTerm(sTerm: String){
        self.searchTerm = sTerm
    }
    
    public func emptyArray(){
        bookResult.removeAll()
    }
    
    public func findISBNBooks(isbn: String){
        self.bookResult.removeAll()
        
        let result = self.dataModel.findISBNBooks(isbn: isbn)
        result.forEach({book in
            self.bookResult.append(book)
        })
    }
}


