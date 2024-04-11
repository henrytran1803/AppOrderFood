//
//  ContentView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        if userSettings.isLoggedIn {
            TabView() // or any other authenticated view
        } else {
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
        
}
