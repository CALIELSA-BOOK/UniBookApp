//
//  BookViewModel.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-09-27.
//

import Foundation
import SwiftUI

final class BookViewModel: ObservableObject {
    
    struct Book: Identifiable{
        var id = UUID()
        var name: String
        var authors: String
        var isbn: String
        var bookCover: String // Change later
    }
    
    @Published var books = [Book(name: "Calculus", authors: "Pelle, Calle", isbn: "123456789", bookCover: "book.closed")]
}
