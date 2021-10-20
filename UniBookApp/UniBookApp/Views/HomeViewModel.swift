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
    private var disposables = Set<AnyCancellable>()
    
    init(model: DataModel){
        self.dataModel = model
        //self.dataModel.booksForSale =
        //self.getRandomBooks()
    }
    
    public func getBooks(){
        self.dataModel.GetBooksForSale()
    }
    
    public func getRandomBooks(){
        print("Hello \(self.dataModel.booksForSale)")
        let result = self.dataModel.booksForSale
//        print("Hello \(result)")
        result.forEach({book in
            self.bookResult.append(book)
        })

    
}
}
