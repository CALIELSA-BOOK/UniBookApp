//
//  ImageUploadView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-09-25.
//

import SwiftUI

/** Add the camera functionality here **/

struct ImageUploadView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.gray)
                .frame(width: 150, height: 150)
                .cornerRadius(10)
                .padding(5)
            Image(systemName: "plus.square")
        }
    }
}

struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView()
    }
}
