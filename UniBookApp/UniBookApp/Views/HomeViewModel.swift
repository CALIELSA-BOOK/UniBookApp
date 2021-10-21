//
//  HomeViewModel.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-19.
//
import SwiftUI
import Foundation
import Combine

class HomeViewModel: ObservableObject{
    @ObservedObject private var dataModel: DataModel
    @Published public var bookResult: [Book] = []
    @Published public var start: String = "start"
    @Published public var booksFiltered: [Book] = []
    private var disposables = Set<AnyCancellable>()
    
    init(model: DataModel){
        self.dataModel = model
    }
    
    public func getBooks(){
        self.dataModel.GetBooksForSale()
    }
    
    public func getRandomBooks(){
        let result = self.dataModel.booksForSale
        result.forEach({book in
            self.bookResult.append(book)
        })
        self.start = ""
    }
    
    public func filterUniqueBooks(){
        let unique = Array(Set(self.bookResult))
        self.booksFiltered = unique
    }
}
