//
//  ContentView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    var body: some View {
        
        let isLogin = UserDefaults.standard.bool(forKey: "isLogin")
        if isLogin {
            TabView() // or any other authenticated view
        } else {
            WelcomeView()
        }
    }
}

#Preview {
    ContentView()
        
}
