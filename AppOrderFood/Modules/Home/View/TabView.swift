//
//  TabView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//


import SwiftUI
struct TabView: View {
    @State private var tabSelected: Tab = .house

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            VStack {
                switch tabSelected {
                case .house:
                    HomeView()
                case .cart:
                    CartView()
                case .person:
                    WelcomeView()
                }

                Spacer()
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $tabSelected)
                
            }
        }.ignoresSafeArea()
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView()
    }
}
