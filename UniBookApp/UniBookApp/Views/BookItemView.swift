//
//  BookItemView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-10.
//

import SwiftUI

struct BookItemView: View {
    var booktitle: String
    var bookauthor: String
    var bookISBN: String
    var bookPrice: Int
    //book Image
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack{
                Rectangle()
                    .fill(Color(red: 196/255, green: 196/255, blue: 196/255))
                    .cornerRadius(15)
                    .frame(width: geometry.size.width, height: geometry.size.height * 8)
                HStack(){
                    Image(systemName: "book.closed") //image
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width * 0.3, height: geometry.size.height*6)
                    VStack(alignment: .leading){
                        Text(booktitle)
                            .font(.system(size: geometry.size.height * 1.5, weight: .medium, design: .default))
                        Text(bookauthor)
                            .font(.system(size: geometry.size.height, weight: .medium, design: .default))
                    }
                    Spacer()
                    VStack {
                        Text(String(bookPrice))
                            .foregroundColor(Color(red: 92/255, green: 132/255, blue: 111/255))
                            .font(.system(size: geometry.size.height * 3, weight: .medium, design: .default))
                        Text("KR")
                    }
                }
            }
        }
    }
}

struct BookItemView_Previews: PreviewProvider {
    static var previews: some View {
        BookItemView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789",bookPrice: 320)
    }
}
