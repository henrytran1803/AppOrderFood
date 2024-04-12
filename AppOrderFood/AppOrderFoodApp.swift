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

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      let providerFactory = AppCheckDebugProviderFactory()
      AppCheck.setAppCheckProviderFactory(providerFactory)


    FirebaseApp.configure()

    return true
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
