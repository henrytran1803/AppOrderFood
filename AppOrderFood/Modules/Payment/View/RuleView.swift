//
//  RuleView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 04/04/2024.
//

import SwiftUI

struct RuleView: View {
    var body: some View {
                Text("Hello, World!")
                    .onAppear {
                        print("🔵 onAppear")
                    }
                    .onDisappear {
                        print("🔵 onDisappear")
                    }
    }
}

#Preview {
    RuleView()
}
