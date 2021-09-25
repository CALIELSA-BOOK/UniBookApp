//
//  BookInformationView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-09-25.
//

import SwiftUI

struct BookInformationView: View {
    var booktitle: String
    var bookauthor: String
    var bookISBN: String
    
    var body: some View {
        HStack{
            Image(systemName: "book.closed") /**Excahnge for real book cover**/
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            VStack(alignment: .leading){
                Text(booktitle)
                    .font(.system(size: 26, weight: .medium, design: .default))
                    .padding()
                Text(bookauthor)
                    .font(.system(size: 16, weight: .light, design: .default))
                Text("ISBN: \(bookISBN)")
                    .font(.system(size: 16, weight: .bold, design: .default))
            }
        }
    }
}

struct BookInformationView_Previews: PreviewProvider {
    static var previews: some View {
        BookInformationView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789")
    }
}
