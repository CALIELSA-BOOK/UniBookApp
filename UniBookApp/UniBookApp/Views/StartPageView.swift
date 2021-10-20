//
//  StartPageView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-27.
//

import SwiftUI

struct StartPageView: View {
    @State private var isShowingDetails = false

    var body: some View {
        VStack{
            Text("UniBooks")
                .font(.title)
            Text("Second Hand Course Literature")
            
            Image("books")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                .shadow(radius:70)
                .padding()
           
            FBLoginView()
        }
    }
}

struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView()
    }
}

