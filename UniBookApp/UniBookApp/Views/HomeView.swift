//
//  HomeView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-09.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            if #available(iOS 15.0, *) {
                Text("")
                   .searchable(text: $searchText)
            } else {
                // Fallback on earlier versions
            }
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
                    .font(.system(size: 20.0))
                    .bold()
                    //set to left side
                ScrollView{
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 340, height: 60)
                        .cornerRadius(10)
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 340, height: 60)
                        .cornerRadius(10)
                    Rectangle()
                        .fill(Color.gray)
                        .frame(width: 340, height: 60)
                        .cornerRadius(10)
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 340, height: 60)
                        .cornerRadius(10)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct PreviewPopularBooksView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 20) {
                ForEach(0..<5) { index in
                    BookInformationView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789")
                        .foregroundColor(.black)
                        .frame(width: 250, height: 150)
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
        }
    }
}
