//
//  ProfileView.swift
//  UniBookApp
//
//  Created by Linnea Bonnevier on 2021-10-12.
//

import SwiftUI

struct ProfileView: View {
    @State private var isShowingDetails = false
    
    var body: some View {
        VStack{
            List{
                HStack{
                    //Facebook profile picture
                    Image(systemName: "person.crop.circle")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    // Change to Username
                    Text("Name Surname")
                        .font(.largeTitle)
                }
                NavigationLink(destination: Text("Comming soon")){
                    Text("Settings")
                }
                NavigationLink(destination: Text("My Published Ads")){
                    Text("My Ads")
                }
                NavigationLink(destination: AdView()){
                    Text("1")
                }
            }
            //FIX so that user is logged out when pressing button
            FBLoginView()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
