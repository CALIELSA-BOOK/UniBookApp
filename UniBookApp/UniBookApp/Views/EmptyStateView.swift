//
//  EmptyStateView.swift
//  UniBookApp
//
//  Created by Carl Leandersson on 2021-10-17.
//

import SwiftUI

struct EmptyStateView: View {
  var body: some View {
    VStack {
      Text("")
      Spacer()
    }
  }
}

struct SavedStateView: View {
  var body: some View {
    VStack {
      Text("Ad Saved!")
      Spacer()
    }
  }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
