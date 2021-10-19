//
//  HomeViewModel.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-19.
//

import SwiftUI

class HomeViewModel: ObservableObject{
    @ObservedObject private var dataModel: DataModel
    
    init(model: DataModel){
        self.dataModel = model
    }
    
}
