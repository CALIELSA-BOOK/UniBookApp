//
//  ISBNSource.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-02.
//

import Foundation
import SwiftUI

class ISBNSource{

    func getBookInfo(isbn: String, completion: @escaping (ISBNData) -> Void) {
        let sessionConfig = URLSessionConfiguration.default

        let session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)

        guard let URL = URL(string: "https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbn) else {return}

        var request = URLRequest(url: URL)
        request.httpMethod = "GET"

        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            if (error == nil) {
                guard let jsonData = data else {return}
                
                do {
                    let bookData = try JSONDecoder().decode(ISBNData.self, from: jsonData)
                    completion(bookData)
                }catch{
                    print(error)
                }
                
            }
            else {
                print(error!.localizedDescription);
            }
        })
        task.resume()
    }
}
