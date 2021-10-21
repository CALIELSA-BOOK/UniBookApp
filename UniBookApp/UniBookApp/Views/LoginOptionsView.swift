//
//  LoginOptionsView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-10-14.
//

import SwiftUI

struct LoginOptionsView: View {
    var body: some View {
        VStack{
            Text("Get started!")
                .font(.title)
                .padding(.top, -150)
            VStack{
                Text("Choose an option")
                    .font(.subheadline)
                    .foregroundColor(Color(red: 161/255, green: 164/255, blue: 178/255))
                FBLoginView()
            }
        }
    }
}

struct LoginOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        LoginOptionsView()
    }
}

