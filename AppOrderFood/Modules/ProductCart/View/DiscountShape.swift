//
//  DiscountShape.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import SwiftUI

struct DiscountShape: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color("bgproduct"))
            .frame(width: .infinity, height: 120)
            .overlay(
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: .infinity, height: 100)
                .foregroundColor(Color.white)
                .padding(20)
                    HStack {
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("bgproduct"))
                        Spacer()
                        Circle()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("bgproduct"))
                    }
                    
        }
        )
    }
}

#Preview {
    DiscountShape()
}
