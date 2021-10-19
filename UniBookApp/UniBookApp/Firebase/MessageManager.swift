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
    var messageRef: DatabaseReference = Database.database().reference().ref.child("/Books")
  var messageHandle: DatabaseHandle?
  
  func startMessageListener() {
    messageHandle = messageRef.observe(.value, with: { snapshot in
        if let value = snapshot.childSnapshot(forPath: "booktitle").value as? String{
        self.message = value
    //self.message = snapshot.childSnapshot(forPath: "booktitle").value

      }
    })
  }
  
  func stopMessageListener() {
    if messageHandle != nil {
      messageRef.removeObserver(withHandle: messageHandle!)
    }
  }

    func writeToDatabase(){
        messageRef.child("Books").child("booktitle").setValue(["booktitle": "AAAAAA"])

    }
}
