//
//  ImageUploadView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-09-25.
//

import SwiftUI
import UIKit

/** Add the camera functionality here **/

struct ImageUploadView: View {
    
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
                    }
                }
            }else{
                Image(uiImage: self.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .clipped()
                    .padding(5)
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
}

struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView()
    }
}
