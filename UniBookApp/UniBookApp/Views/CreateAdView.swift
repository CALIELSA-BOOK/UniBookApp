//
//  AdView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-09-25.
//
import SwiftUI

struct CreateAdView: View {
    @ObservedObject var adViewModel: CreateAdViewModel
    @ObservedObject var searchViewModel: SearchViewModel
    @State private var price: String = ""
    @State private var bookComment: String = ""
    @State private var bookEmail: String = ""
    @State private var selection = 1
    @State var isShowingDetails: Bool = false
    @State private var isSaved: Bool = false
    @StateObject var isbnView = ViewBool()
    @ObservedObject var isLoading: LoadingStatus
    var arrayOfConditions = ["New","Good","Fair","Poor"]
    
    var body: some View {
        VStack{
            
            if adViewModel.booksForAd.isEmpty{
                NavigationLink("Search ISBN",destination: ISBNSearchView(adViewModel: adViewModel, viewBool: isbnView,isLoading: isLoading).onDisappear(perform:{
                    adViewModel.isLoading.isLoading = .awaiting
                }), isActive: $isbnView.viewBool)
                    .foregroundColor(.white)
                    .padding(.all)
                    .frame(width: 250, height: 50)
                    .background(Color(red: 25/255, green: 85/255, blue: 166/255))
                    .cornerRadius(16)
                    .simultaneousGesture(TapGesture().onEnded{
                        self.isbnView.viewBool = true
                    })
                
            }
            if isSaved{
                VStack{
                    Text("You ad has been saved")
                        .font(.system(size: 30, weight: .medium)).onDisappear(perform: {
                            self.isSaved = false
                        })
                    
                }
                
            }
            
            if !adViewModel.booksForAd.isEmpty{
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
                VStack{
                    Text("Email")
                        .font(.system(size: 18, weight: .medium))
                    TextField("Email", text: $bookEmail)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                }
                NavigationLink("Create AD",destination: SavedStateView(), isActive: $isSaved)
                    .foregroundColor(.white)
                    .padding(.all)
                    .frame(width: 250, height: 50)
                    .background(Color(red: 25/255, green: 85/255, blue: 166/255))
                    .cornerRadius(16)
                    .simultaneousGesture(TapGesture().onEnded{ isSaved = true
                        adViewModel.CreateAd(price: price, bookComment: bookComment, condition: arrayOfConditions[selection], email: bookEmail){book in
                            var tempBook = book
                            tempBook.imageURL = ""
                            tempBook.seller = UserDefaults.standard.string(forKey: "facebookID")!
                            searchViewModel.userBookResult.append(tempBook)
                            price=""
                            bookComment=""
                            bookEmail=""
                        }
                        
                    })
                
            }
        }
        Spacer()
        
            .navigationTitle("Create Ad")
    }
}
