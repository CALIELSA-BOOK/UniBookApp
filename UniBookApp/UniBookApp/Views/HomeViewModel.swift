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
    //@ObservedObject private var booksForSale: [Book] = []
    @Published public var bookResult: [Book] = []
    @Published public var start: String = "start"
    @Published public var booksFiltered: [Book] = [] //all unique books
    private var disposables = Set<AnyCancellable>()

    init(model: DataModel){
        self.dataModel = model
    }

    public func getBooks(){
        self.dataModel.GetBooksForSale()
    }

    public func getRandomBooks(){
        print("Hello \(self.dataModel.booksForSale)")
        let result = self.dataModel.booksForSale
        result.forEach({book in
            self.bookResult.append(book)
        })
        self.start = ""
    }

    public func filterUniqueBooks(){
        let unique = Array(Set(self.bookResult))
        print("Hello \(unique)")
        self.booksFiltered = unique
    }
}
