
//// AppDelegate.swift
import UIKit
import FBSDKCoreKit
import UserNotifications
import FirebaseDatabase

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var messageRefBooks: DatabaseReference = Database.database().reference().ref.child("/APN")
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        registerForPushNotifications()
        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )

        return true
    }
    func registerForPushNotifications() {
         UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
             (granted, error) in
             print("Permission granted: \(granted)")
             
             if granted{

             }
             
             guard granted else { return }
             self.getNotificationSettings()
         }
     }
    func getNotificationSettings() {
          UNUserNotificationCenter.current().getNotificationSettings { (settings) in
              print("Notification settings: \(settings)")
              guard settings.authorizationStatus == .authorized else { return }
              DispatchQueue.main.async {
                  UIApplication.shared.registerForRemoteNotifications()
              }
              
          }
        
    }
    func application(_ application: UIApplication,
                        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data -> String in
            return String(format: "%02.2hhx", data)
        }
        
        let token = tokenParts.joined()
        print("Device Token: \(token)")

        self.messageRefBooks.child(UIDevice.current.identifierForVendor!.uuidString).setValue(token)
           }
        
    
          
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {

        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
    }
}
