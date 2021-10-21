//
//  ImageUploadView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-09-25.
//

import SwiftUI
import UIKit

struct ImageUploadView: View {
    @ObservedObject var adViewModel: CreateAdViewModel
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    
    @State private var activeImage = false
    
    var body: some View {
        VStack {
            if activeImage == false {
                ZStack{
                    Rectangle()
                        .fill(Color(red: 196/255, green: 196/255, blue: 196/255))
                        .frame(width: 150, height: 150)
                        .cornerRadius(7)
                        .padding(5)
                    Button(action: {
                        self.isShowPhotoLibrary = true
                        self.activeImage = true
                    }) {
                        Image(systemName: "plus.square")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                }
            }else{
                ZStack{
                    Image(uiImage: self.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                        .padding(5)
                    Button(action: {
                        self.isShowPhotoLibrary = false
                        self.activeImage = false
                        adViewModel.images.removeAll()
                    }) {
                        Image(systemName: "multiply.square.fill")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 20, height: 20)
                            .background(Color.white)
                            .foregroundColor(.red)
                    }
                    .offset(x: -70,y: -70)
                }
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(adViewModel:adViewModel, sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
}
