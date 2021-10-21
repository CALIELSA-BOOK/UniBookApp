//
//  DisplayAdView.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-20.
//

import SwiftUI
import SDWebImageSwiftUI
struct DisplayAdView: View {
    @ObservedObject var adViewModel: CreateAdViewModel
    @ObservedObject var searchViewModel: SearchViewModel
    var book: Book
    var body: some View {
        if !book.id.isEmpty{
        VStack{BookInformationView(booktitle: book.name,bookauthor: book.authors,bookISBN: book.isbn)
        
            VStack{
                Text("Price: " + book.price!)
                    .font(.system(size: 26, weight: .medium, design: .default))
            }
            VStack{
                Text("Condition of Book: " + book.condition!)
                    .font(.system(size: 16, weight: .light, design: .default))
            }
            if book.imageURL == ""{
                Image(systemName: "photo").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 120)
            }
            else {
                WebImage(url: URL(string: book.imageURL!)).resizable().placeholder(Image(systemName: "photo")).placeholder{
                        Rectangle().foregroundColor(.gray)
                    }.indicator(.activity).transition(.fade(duration: 0.3)).scaledToFit().frame(width:UIScreen.main.bounds.width/2, alignment: .center)
                }
            Spacer()
            if book.seller == UserDefaults.standard.string(forKey: "facebookID"){
                Button("Delete AD"){
                    adViewModel.deleteBook(id: book.id)
                    adViewModel.GetBooksForSale()
                    adViewModel.emptyArrays()
                    searchViewModel.findUserBooks(seller: UserDefaults.standard.string(forKey: "facebookID")!)
                    }.foregroundColor(.white).padding(.all).frame(width: 250, height: 50).background(Color(red: 255/255, green: 1/255, blue: 1/255)).cornerRadius(16)
            }
            Button("Contact Seller"){
                if let url = URL(string: "mailto:\(book.seller!)?subject=UniBookApp%20"+book.name+"%20&body=I%20would%20like%20to%20buy%20your%20book")
                {
                    UIApplication.shared.open(url)
                }
                
                }.foregroundColor(.white).padding(.all).frame(width: 250, height: 50).background(Color(red: 25/255, green: 85/255, blue: 166/255)).cornerRadius(16)
        }
            
        }
        else{
            Text("Book deleted")
        }
        
        
    }
}
