//
//  ViewRouter.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-02.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    
    @Published var currentPage: Page = .home
    
}

enum Page {
     case home
     case search
     case add
     case profile
 }
