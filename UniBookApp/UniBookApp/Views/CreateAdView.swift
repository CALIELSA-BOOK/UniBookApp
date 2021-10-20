//
//  AdView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-09-25.
//

import SwiftUI

struct CreateAdView: View {
    @ObservedObject var adViewModel: CreateAdViewModel
    @State private var price: String = ""
    @State private var bookComment: String = ""
    @State private var selection = 1
    @State var isShowingDetails: Bool = false
    @StateObject var isbnView = ViewBool()
    var arrayOfConditions = ["New","Good","Fair","Poor"]
    // @ObservedObject var viewModel = BookViewModel() -- > Could work like this later
    var booksNew = Book(id: UUID(),name: "Calculus", authors: "Pelle, Calle", isbn: "123456789", bookCover: "book.closed")
    
    var body: some View {
        VStack{
            
            if adViewModel.booksForAd.isEmpty{
                NavigationLink("Search ISBN",destination: ISBNSearchView(adViewModel: adViewModel, viewBool: isbnView), isActive: $isbnView.viewBool)
                        .foregroundColor(.white)
                        .padding(.all)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 25/255, green: 85/255, blue: 166/255))
                        .cornerRadius(16)
                        .simultaneousGesture(TapGesture().onEnded{
                            self.isbnView.viewBool = true
                        })
            
                }
            
            else{
                BookInformationView(booktitle: adViewModel.booksForAd[0].name,bookauthor:  adViewModel.booksForAd[0].authors,bookISBN:  adViewModel.booksForAd[0].isbn)
  
            VStack{
                Text("Upload image")
                    .font(.system(size: 18, weight: .medium))
                HStack{
                    ImageUploadView(adViewModel: adViewModel)
                    //ImageUploadView(adViewModel: adViewModel)
                }
            }
            VStack{
                Text("Condition of Book")
                    .font(.system(size: 18, weight: .medium))
                Picker("Condition", selection: $selection) {
                                    ForEach(0 ..< arrayOfConditions.count) {
                                        Text(arrayOfConditions[$0])
                                    }
                                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.bottom)
            }
            VStack{
                Text("Price")
                    .font(.system(size: 18, weight: .medium))
                TextField("Price", text: $price)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
            }
            VStack{
                Text("Comment")
                    .font(.system(size: 18, weight: .medium))
                TextField("Comment", text: $bookComment)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
            }
            //Could add a picker for course name if we have time
            // Send in data to preview View
                NavigationLink("Create AD",destination: SavedStateView(), isActive: $isShowingDetails)
                    .foregroundColor(.white)
                    .padding(.all)
                    .frame(width: 250, height: 50)
                    .background(Color(red: 25/255, green: 85/255, blue: 166/255))
                    .cornerRadius(16)
                    .simultaneousGesture(TapGesture().onEnded{
                        adViewModel.CreateAd(price: price, bookComment: bookComment, condition: arrayOfConditions[selection])
                    })
                
            }
            }
            Spacer()
        
            .navigationTitle("Create Ad")
    }
}
    

