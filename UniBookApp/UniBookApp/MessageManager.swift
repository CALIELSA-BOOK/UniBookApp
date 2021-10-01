//
//  MessageManager.swift
//  UniBookApp
//
//  Created by Eleonora on 2021-09-29.
//

import FirebaseDatabase
import Foundation

class MessageManager: ObservableObject {
  @Published var message = "Does it work?"
  var messageRef: DatabaseReference = Database.database().reference().ref.child("/message")
  var messageHandle: DatabaseHandle?
  
  func startMessageListener() {
    messageHandle = messageRef.observe(.value, with: { snapshot in
      if let value = snapshot.value as? String{
        self.message = value
      }
    })
  }
  
  func stopMessageListener() {
    if messageHandle != nil {
      messageRef.removeObserver(withHandle: messageHandle!)
    }
  }
}
