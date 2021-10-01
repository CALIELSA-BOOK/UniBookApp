//
//  ContentView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI
import Firebase
import FirebaseDatabase

struct ContentView: View {
@ObservedObject var messageManager = MessageManager()
    var body: some View {
        VStack{
            Text("Welcome to UniBookApp")
                .font(.title)
            Text("aa")
                .font(.subheadline)
            Text(messageManager.message)
                  .padding().onAppear {
                    messageManager.startMessageListener()
                  }.onDisappear {
                    messageManager.stopMessageListener()
                  }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

