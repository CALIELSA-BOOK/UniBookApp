//
//  FooterView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-02.
//

import SwiftUI

struct FooterView: View {
    @StateObject var viewRouter: ViewRouter

    var body: some View {
        GeometryReader { geometry in
            VStack{
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    Text("Home")
                case .add:
                    AdView()
                case .search:
                   Text("Search")
                case .profile:
                    Text("Profile")
                }
                Spacer()
                HStack{
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/4, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .search, width: geometry.size.width/4, height: geometry.size.height/28, systemIconName: "magnifyingglass", tabName: "Search")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .add, width: geometry.size.width/4, height: geometry.size.height/28, systemIconName: "plus", tabName: "Add")
                    TabBarIcon(viewRouter: viewRouter, assignedPage: .profile, width: geometry.size.width/4, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Profile")
                }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color(red: 196/255, green: 196/255, blue: 196/255).shadow(radius: 2))
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    
    let width, height: CGFloat
    let systemIconName, tabName: String

    var body: some View {
        VStack {
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
            .padding(.horizontal, -4)
            .onTapGesture {
                viewRouter.currentPage = assignedPage
            }
    }
}
