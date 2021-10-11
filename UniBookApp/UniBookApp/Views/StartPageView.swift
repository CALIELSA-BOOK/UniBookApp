//
//  StartPageView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-27.
//

import SwiftUI

struct StartPageView: View {
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
           
            PrimaryButton()
                .navigationTitle("LoginOptionsView")
            //Button("Let's Go", action: start)
        }
    }
}

struct StartPageView_Previews: PreviewProvider {
    static var previews: some View {
        StartPageView()
    }
}

struct PrimaryButton: View {
    var body: some View {
        Text("Let's Go")
            .font(.title)
            .foregroundColor(.white)
            .frame(maxWidth: 200)//200?
            .padding()
            .background(Color(red: 25/255, green: 85/255, blue: 166/255))
            .cornerRadius(50)
    }
}
