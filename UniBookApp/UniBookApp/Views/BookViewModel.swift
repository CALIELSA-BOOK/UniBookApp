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

struct ISBNData: Decodable {
    var items: [BookData]
}

struct BookData: Decodable {
    let id: String
    let volumeInfo: VolumeInfo
}

struct VolumeInfo: Decodable {
    let title: String
    let authors: [String]
    let publishedDate: String
    let language: String
}


