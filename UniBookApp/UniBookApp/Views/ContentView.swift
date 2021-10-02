//
//  ContentView.swift
//  UniBookApp
//
//  Created by Sara Damne on 2021-09-21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        VStack{
            FooterView(viewRouter: viewRouter)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
