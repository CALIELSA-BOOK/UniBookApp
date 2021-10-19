//
//  HomeViewModel.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-19.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    @ObservedObject private var dataModel: DataModel
    @Published public var bookResult: [Book] = []
    
    init(model: DataModel){
        self.dataModel = model
    }
    
    public func getRandomBooks(){
        let result = self.dataModel.GetBooksForSale()
        print(result)
//        result.forEach({book in
//            self.bookResult.append(book)
//        })
    }
}
