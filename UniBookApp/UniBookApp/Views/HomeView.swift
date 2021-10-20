//
//  HomeView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-09.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var homeViewModel: HomeViewModel
    @State private var searchText = ""
    
    var body: some View {
        GeometryReader{ geometry in
        VStack{
            ZStack{
               Rectangle()
                    .fill(Color(red: 25/255, green: 85/255, blue: 166/255))
                    .opacity(70)
                    .frame(height: 280)
                VStack{
                    Text("Popular Literature")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach (homeViewModel.booksFiltered, id: \.self){
                                book in
                                BookInformationView(booktitle: book.name, bookauthor: book.authors, bookISBN: book.isbn)
                                    .foregroundColor(.black)
                                    .frame(width: 250, height: 150)
                                    .background(Color.white)
                            }
                        }
                    }
                }
            }
            Spacer()
            VStack(alignment: .leading){
                Text("Latest Ads")
                    .font(.system(size: 20.0, weight: .bold))
                    .padding(.top)
                ScrollView{
                    ForEach (homeViewModel.bookResult, id: \.self){
                        book in 
                        BookItemView(booktitle: book.name, bookauthor: book.authors, bookISBN: book.isbn, bookPrice: 10)
                            .padding(.bottom,geometry.size.height * 0.10)
                    }
                }
            }
        }
        }
    }
}

