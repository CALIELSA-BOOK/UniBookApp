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
    private var disposables = Set<AnyCancellable>()
    
    init(model: DataModel){
        self.dataModel = model
        //self.dataModel.GetBooksForSale()
        //self.getRandomBooks()
    }
    
    public func getRandomBooks(){
        print("Hello \(self.dataModel.$booksForSale)")
        let result = self.dataModel.booksForSale
        print("Hello \(result)")
        result.forEach({book in
            self.bookResult.append(book)
        })

    
}
}
