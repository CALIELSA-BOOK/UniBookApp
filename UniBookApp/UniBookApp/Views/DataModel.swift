//
//  DataModel.swift
//  UniBookApp
//
//  Created by Eleonora on 2021-10-15.
//
//
import FirebaseDatabase
import Foundation
import GameKit

struct Book: Identifiable{
    var id = UUID()
    var name: String
    var authors: String
    var isbn: String
    var bookCover: String // Change later
}

/*struct ISBNData: Decodable {
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
*/
class DataModel: ObservableObject {
    @Published var message: String = "fetching"
    var messageRefBooks: DatabaseReference = Database.database().reference().ref.child("/Books4Sale")
    var messageHandleBooks: DatabaseHandle?
    var messageRefUser: DatabaseReference = Database.database().reference().ref.child("/Users")
    var messageHandleUser: DatabaseHandle?
  
  func startMessageListener() {
    messageHandleBooks = messageRefBooks.observe(.value, with: { snapshot in
        if let value = snapshot.childSnapshot(forPath: "Book1/authors").value as? String{
        self.message = value

      }
    })
  }
  
  func stopMessageListener() {
    if messageHandleBooks != nil {
        messageRefBooks.removeObserver(withHandle: messageHandleBooks!)
    }
  }

    func writeToDatabase(){
        messageRefBooks.child("Books").child("booktitle").setValue(["booktitle": "AAAAAA"])
    }

    ///functions
    func GetBooksForSale() {
      messageHandleBooks = messageRefBooks.observe(.value, with: { snapshot in
          if let value = snapshot.childSnapshot(forPath: "Book1/authors").value as? String{
          self.message = value

        }
      })
    }
    
    
    func GetUserInfo() {
      //returns books with the ISBN for sale
      }
    func SaveBookInfo(book:Book) {
        var booksDict = ["name": book.name, "authors": book.authors, "isbn": book.isbn, "bookCover": book.bookCover, "id": book.id.uuidString]
        messageRefBooks.child("Bok2").setValue(booksDict)
      }
    func DeleteBookForSale() {
      //returns books with the ISBN for sale
      }
    }


        
