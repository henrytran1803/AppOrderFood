//
//  AdminView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 25/04/2024.
//

import SwiftUI

struct AdminView: View {
    @State private var tabSelected: TabAdmin = .cate

    init() {
        UITabBar.appearance().isHidden = true
    }

    var body: some View {
        ZStack {
            VStack {
                switch tabSelected {
                case .cate:
                    CategoryManagerView()
                case .product:
                    ProductManagerView()
                case .order:
                    SettingView()
                }

                Spacer()
            }
            VStack {
                Spacer()
                CustomTabbarAdmin(selectedTab: $tabSelected)
                
            }
        }
    }
}

#Preview {
    AdminView()
}
