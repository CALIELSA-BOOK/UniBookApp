//
//  ContentView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    Text("Home") //exchange text for homepageview
                        .navigationTitle("Welcome to UniBookApp")
                    FooterView()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
