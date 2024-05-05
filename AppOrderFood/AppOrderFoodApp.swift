//
//  AppOrderFoodApp.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI
import SwiftData
import FirebaseCore
import FirebaseAuth
import FirebaseAppCheck
import UserNotifications
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)

        FirebaseApp.configure()

        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        let content = UNMutableNotificationContent()
        content.title = "Order food đợi bạn quay lại."
        content.subtitle = "I love you!."
        content.sound = UNNotificationSound.default

        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)

        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        UNUserNotificationCenter.current().add(request)
    }

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        // Chuyển tiếp thông báo cho FIRAuth
        if Auth.auth().canHandleNotification(userInfo) {
            print("Remote notification forwarded to FIRAuth: \(userInfo)")
        }
    }
}
@main
struct AppOrderFoodApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
