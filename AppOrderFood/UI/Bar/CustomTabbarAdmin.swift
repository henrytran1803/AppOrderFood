//
//  CustomTabbarAdmin.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 25/04/2024.
//

import SwiftUI
enum TabAdmin: String, CaseIterable {
    case cate
    case product
    case order
}
struct CustomTabbarAdmin: View {
    @Binding var selectedTab: TabAdmin
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(TabAdmin.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? .white : .gray)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 70)
            .background(Color("bgproduct"))
            .cornerRadius(20)
            .padding()
        }
    }
}

#Preview {
    CustomTabbarAdmin(selectedTab: .constant(TabAdmin.cate))
}
