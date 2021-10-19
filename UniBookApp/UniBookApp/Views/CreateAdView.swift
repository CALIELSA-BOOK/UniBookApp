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
    @State private var isShowingDetails = false
    @StateObject var isbnView = ViewBool()
    var arrayOfConditions = ["New","Good","Fair","Poor"]
    // @ObservedObject var viewModel = BookViewModel() -- > Could work like this later
    var booksNew = Book(id: UUID(),name: "Calculus", authors: "Pelle, Calle", isbn: "123456789", bookCover: "book.closed")
    
    var body: some View {
        VStack{
            
            if adViewModel.booksForAd.isEmpty{
                NavigationLink(destination: ISBNSearchView(adViewModel: adViewModel, viewBool: isbnView), isActive: $isbnView.viewBool){
                    Button("Search ISBN")
                        {
                            //messageManager.SaveBookInfo(book:booksNew)
                            self.isbnView.viewBool = true
                        }
                        .foregroundColor(.white)
                        .padding(.all)
                        .frame(width: 250, height: 50)
                        .background(Color(red: 25/255, green: 85/255, blue: 166/255))
                        .cornerRadius(16)
                    }
                }
            
            else{
                BookInformationView(booktitle: adViewModel.booksForAd[0].name,bookauthor:  adViewModel.booksForAd[0].authors,bookISBN:  adViewModel.booksForAd[0].isbn)
  
            VStack{
                Text("Upload image")
                    .font(.system(size: 18, weight: .medium))
                HStack{
                    ImageUploadView()
                    ImageUploadView()
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
            NavigationLink(destination: SavedStateView(), isActive: $isShowingDetails){
                Button("POST AD")
                    {
                        //Create AD
                       adViewModel.CreateAd(price: price, bookComment: bookComment, condition: arrayOfConditions[selection])
                        adViewModel.booksForAd.removeAll();
                        self.isShowingDetails = true
                        
                        }
                        //Remove current fetch from API.
                     
                    }
                    .foregroundColor(.white)
                    .padding(.all)
                    .frame(width: 250, height: 50)
                    .background(Color(red: 25/255, green: 85/255, blue: 166/255))
                    .cornerRadius(16)
            }
                
            }
            Spacer()
        
            .navigationTitle("Create Ad")
    }
}

/*
struct AdView_Previews: PreviewProvider {
    static var previews: some View {
        AdView()
    }
}*/


/*
 //
 //  AdView.swift
 //  UniBookApp
 //
 //  Created by Linnea Bonnevier on 2021-09-25.
 //

 import SwiftUI

 struct AdView: View {
     
     @State private var price: String = ""
     @State private var bookComment: String = ""
     
     @State private var selection = 1
     @State private var isShowingDetails = false
     var arrayOfConditions = ["New","Good","Fair","Poor"]
     
     // @ObservedObject var viewModel = BookViewModel() -- > Could work like this later
     
     var body: some View {
         VStack{
             BookInformationView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789")
             VStack{
                 Text("Upload image")
                     .font(.system(size: 18, weight: .medium))
                 HStack{
                     ImageUploadView()
                     ImageUploadView()
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
             NavigationLink(destination: PreviewAdView(), isActive: $isShowingDetails){
                 Button("POST AD")
                     {
                         self.isShowingDetails = true
                     }
                     .foregroundColor(.white)
                     .padding(.all)
                     .frame(width: 250, height: 50)
                     .background(Color(red: 25/255, green: 85/255, blue: 166/255))
                     .cornerRadius(16)
             }
            
             Spacer()
         }
             .navigationTitle("Create Add")
     }
 }


 struct AdView_Previews: PreviewProvider {
     static var previews: some View {
         AdView().previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
     }
 }

 
 */

/*
 struct AdView: View {
     @ObservedObject var messageManager: DataModel
     
     @State private var price: String = ""
     @State private var bookComment: String = ""
     
     @State private var selection = 1
     @State private var isShowingDetails = false
     var arrayOfConditions = ["New","Good","Fair","Poor"]
     // @ObservedObject var viewModel = BookViewModel() -- > Could work like this later
     var booksNew = Book(id: UUID(),name: "Calculus", authors: "Pelle, Calle", isbn: "123456789", bookCover: "book.closed")
     var body: some View {
         VStack{
             BookInformationView(booktitle: "Calulus - A Complete Course",bookauthor: "Name Surname",bookISBN: "123456789")
             VStack{
                 Text("Upload image")
                     .font(.system(size: 18, weight: .medium))
                 HStack{
                     ImageUploadView()
                     ImageUploadView()
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
                 Text(messageManager.message)
                                  .padding().onAppear {
                                      messageManager.SaveBookInfo(book:booksNew)
                                     
                                  }.onDisappear {
                                    messageManager.stopMessageListener()
                                  }
                 Text("Comment")
                     .font(.system(size: 18, weight: .medium))
                 TextField("Comment", text: $bookComment)
                     .textFieldStyle(RoundedBorderTextFieldStyle())
                     .padding(.bottom)
             }
             //Could add a picker for course name if we have time
             // Send in data to preview View
             NavigationLink(destination: PreviewAdView(), isActive: $isShowingDetails){
                 Button("POST AD")
                     {
                         self.isShowingDetails = true
                     }
                     .foregroundColor(.white)
                     .padding(.all)
                     .frame(width: 250, height: 50)
                     .background(Color(red: 25/255, green: 85/255, blue: 166/255))
                     .cornerRadius(16)
             }
            
             Spacer()
         }
             .navigationTitle("Create Add")
     }
 }
 */
