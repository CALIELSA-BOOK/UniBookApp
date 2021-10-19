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
                    PreviewPopularBooksView()
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
                    }
//                    BookItemView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789",bookPrice: 230)
//                        .padding(.bottom,geometry.size.height * 0.10)
//                    BookItemView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789",bookPrice: 340)
//                        .padding(.bottom,geometry.size.height * 0.10)
//                    BookItemView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789",bookPrice: 500)
//                        .padding(.bottom,geometry.size.height * 0.10)
//                    BookItemView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789",bookPrice: 320)
//                        .padding(.bottom,geometry.size.height * 0.10)
                }
            }
        }
        }
    }
}

//struct HomeView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeView()
//    }
//}


struct PreviewPopularBooksView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<5) { index in
                    BookInformationView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789")
                        .foregroundColor(.black)
                        .frame(width: 250, height: 150)
                        .background(Color.white)
                }
            }
        }
    }
}
