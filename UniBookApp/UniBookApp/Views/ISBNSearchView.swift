//
//  ISBNSearchView.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-02.
//

import SwiftUI
struct ISBNSearchView: View {
    @ObservedObject var tempBook: ISBNBookViewModel
    var body: some View {
        VStack{
            Text("Title: " + tempBook.title)
            Text("Published date: " + tempBook.publishedDate)
            Text("Authors: ")
            ForEach(tempBook.authors, id: \.self) { author in
                           Text(author)
                       }
            Text("Language: " + tempBook.language)
        }
    }
}

struct EmptyStateView: View {
  var body: some View {
    VStack {
      Text("")
        .font(.title)
      Spacer()
    }
  }
}
/*struct ISBNSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ISBNSearchView()
    }
}
*/
