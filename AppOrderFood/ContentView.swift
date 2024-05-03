//
//  ContentView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    
    @State private var isLogin = UserDefaults.standard.bool(forKey: "isLogin")
    @State private var role = UserDefaults.standard.string(forKey: "role")
    @State private var notificationPermissionGranted = false
    
    var body: some View {
        VStack {
            if isLogin {
                if role == "admin" {
                    AdminView()
                    
                } else {
                    TabView()
                }
            } else {
                WelcomeView()
            }
        }
        .onAppear {
            requestNotificationPermission()
        }
    }
    
    private func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Notification permission granted")
                self.notificationPermissionGranted = true
            } else if let error = error {
                print("Notification permission denied: \(error.localizedDescription)")
                self.notificationPermissionGranted = false
            }
        }
    }
}
    



#Preview {
    ContentView()
        
}
