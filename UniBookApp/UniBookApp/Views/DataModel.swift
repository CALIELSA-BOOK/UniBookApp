//
//  DataModel.swift
//  UniBookApp
//
//  Created by Eleonora on 2021-10-15.
//
//
import FirebaseDatabase
import FirebaseStorage
import Foundation
import GameKit
import SwiftUI

struct Book: Identifiable, Hashable{
    var id: String
    var name: String
    var authors: String
    var isbn: String
    var bookCover: String
    var price:String?
    var comment: String?
    var condition: String?
    var seller: String?
    var imageURL: String?// Change later
}
class DataModel: ObservableObject {
    @Published var message: String = "fetching"
    @Published var userName: String = "Email"
    @Published var booksForSale: [Book] = []
    var messageRefBooks: DatabaseReference = Database.database().reference().ref.child("/Books4Sale")
    @Published var isLoading = LoadingStatus()
    
    func findBooks(name: String) -> [Book]{
        let filtered = booksForSale.filter { Book in
            return Book.name.contains(name)
        }
        return filtered
    }
    
    func findUserBooks(seller: String) -> [Book]{
        let filtered = booksForSale.filter { Book in
            return Book.seller == seller
        }
        return filtered
    }
    
    func deleteBook(id: String){
        messageRefBooks.child(id).removeValue()
    }
    
    func GetBooksForSale() {
        
        messageRefBooks.getData(completion:  { error, snapshot in
            guard error == nil else {
                print(error!.localizedDescription)
                return;
            }
            let dataSnapshot = snapshot.value as! [String : AnyObject]
            for (_,value) in dataSnapshot {
                let bookData = value as! [String : AnyObject]
                
                self.booksForSale.append(Book(id: bookData["id"] as! String, name: bookData["name"] as! String,
                                              authors:(bookData["authors"] as! String),
                                              isbn:bookData["isbn"] as! String,
                                              bookCover:bookData["bookCover"] as! String,
                                              price:(bookData["price"] as! String),
                                              comment:(bookData["seller"] as! String),condition:(bookData["condition"] as! String),seller:(bookData["seller"] as! String),imageURL:bookData["imageURL"] as? String ?? ""))
            }
        }
        );
    }
    
    func SaveBookInfo(book:Book) {
      
        let booksDict = ["name": book.name, "authors": book.authors, "isbn": book.isbn, "bookCover": book.bookCover, "id": book.id, "price": book.price, "comment": book.comment,"condition":book.condition, "seller":UserDefaults.standard.string(forKey: "facebookID")]
        messageRefBooks.child(book.id).setValue(booksDict)
    }
    
    func SaveImage(image: UIImage, id:String){
        let storage = Storage.storage().reference()
        let imageID = UUID()
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            return
        }
        
        storage.child("images/\(imageID.uuidString).jpg").putData(imageData, metadata: nil) { _,error in
            guard error == nil else{
                
                return
            }
            storage.child("images/file.jpg").downloadURL(completion: {url, error in
                guard let url = url, error == nil else {
                    return
                }
                let urlString = url.absoluteString
                self.messageRefBooks.child(id).child("imageURL").setValue(urlString)
                
            })
        }
    }
    func getBookInfo(isbn: String, completion: @escaping (ISBNData) -> Void) {
        if isbn == "" {return}
        else{
            self.isLoading.isLoading = .loading
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        guard let URL = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn) else {return}

        var request = URLRequest(url: URL)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                guard let jsonData = data else {
                    DispatchQueue.main.async {
                        self.isLoading.isLoading = .noresult
                    }
                    return}
                
                do {
                    let bookData = try JSONDecoder().decode(ISBNData.self, from: jsonData)
                    DispatchQueue.main.async {
                        self.isLoading.isLoading = .result
                    }
                    completion(bookData)
                }catch{
                    DispatchQueue.main.async {
                        self.isLoading.isLoading = .noresult
                    }
                    print("catch")
                    print(error)
                }
                
            }
            else {
                self.isLoading.isLoading = .noresult
                print(error!.localizedDescription);
               
            }
        })
            task.resume()
        }
    }
}

class LoadingStatus: ObservableObject{
    @Published var isLoading: loadingStatus = .awaiting
    
    enum loadingStatus{
        case awaiting
        case loading
        case result
        case noresult
    }
}
