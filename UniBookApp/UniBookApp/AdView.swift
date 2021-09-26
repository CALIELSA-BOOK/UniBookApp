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
    var arrayOfConditions = ["New","Good","Fair","Poor"]
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "return")
                Text("Sell Book")
                    .font(.system(size: 32, weight: .medium, design: .default))
            }
            .padding(.bottom,20)
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
            Button(action: {print("Button Tapped")})
                {
                    Text("POST AD")
                }
                .foregroundColor(.white)
                .padding(.all)
                .frame(width: 200, height: 30)
                .background(Color(red: 25/255, green: 85/255, blue: 166/255))
                .cornerRadius(16)
            Spacer()
        }
    }
}

struct AdView_Previews: PreviewProvider {
    static var previews: some View {
        AdView()
    }
}
