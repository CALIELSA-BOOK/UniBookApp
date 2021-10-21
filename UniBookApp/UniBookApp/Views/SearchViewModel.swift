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
    @ObservedObject var isLoading: LoadingStatus
    @Published var searchTerm: String = ""
    @Published public var bookResult: [Book] = []
    @Published public var userBookResult: [Book] = []
    @Published var isbnView: Bool?
    private var disposables = Set<AnyCancellable>()
    
    init(model: DataModel){
        self.dataModel = model
        self.isLoading = model.isLoading
        $searchTerm
            .sink(receiveValue: findBooks(name:))
            .store(in: &disposables)
    }
    
    public func setSearchTerm(sTerm: String){
        self.searchTerm = sTerm
    }
    
    public func emptyArray(){
        bookResult.removeAll()
    }
    
    public func findUserBooks(seller: String){
        self.userBookResult.removeAll()
        
        let result = self.dataModel.findUserBooks(seller: seller)
        result.forEach({book in
            self.userBookResult.append(book)
        })
    }
    
    public func findBooks(name: String){
        
        if name.isEmpty{return}
        else{
            self.bookResult.removeAll()
            let result = self.dataModel.findBooks(name: name)
            if result.isEmpty{
                self.isLoading.isLoading = .noresult
            }
            result.forEach({book in
                self.bookResult.append(book)
            })
        }
    }
}


