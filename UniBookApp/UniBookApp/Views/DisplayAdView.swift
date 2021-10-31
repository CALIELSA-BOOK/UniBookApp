//
//  DisplayAdView.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-20.
//

import SwiftUI
import SDWebImageSwiftUI
struct DisplayAdView: View {
    @State var copied = ""
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
                VStack{
                    Text("Comment: " + book.comment!)
                        .font(.system(size: 16, weight: .light, design: .default))
                }
                VStack{
                    Text("Email: " + book.email!)
                        .font(.system(size: 16, weight: .light, design: .default))
                }
                VStack{
                    Text(copied)
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
                Button("Copy email"){
                
                    copied = "Email copied to clipboard!"
                        UIPasteboard.general.string = book.email
                
                }.foregroundColor(.white).padding(.all).frame(width: 250, height: 50).background(Color(red: 25/255, green: 85/255, blue: 166/255)).cornerRadius(16)
            }
            
        }
        else{
            Text("Book deleted")
        }
        
        
    }
}

struct DisplayMyAdView: View {
    @ObservedObject var searchViewModel: SearchViewModel
    @State var copied = ""
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
                VStack{
                    Text("Comment: " + book.comment!)
                        .font(.system(size: 16, weight: .light, design: .default))
                }
                VStack{
                    Text("Email: " + book.email!)
                        .font(.system(size: 16, weight: .light, design: .default))
                }
                
                VStack{
                    Text(copied)
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
                        self.searchViewModel.deleteBook(id: book.id, book: book)
                        
                    }.foregroundColor(.white).padding(.all).frame(width: 250, height: 50).background(Color(red: 255/255, green: 1/255, blue: 1/255)).cornerRadius(16)
                }
               
                    Button("Copy email"){
                    
                        copied = "Email copied to clipboard!"
                            UIPasteboard.general.string = book.email
                    
                    }.foregroundColor(.white).padding(.all).frame(width: 250, height: 50).background(Color(red: 25/255, green: 85/255, blue: 166/255)).cornerRadius(16)
            }
            
        }
        else{
            Text("Book deleted")
        }
        
        
    }
}

