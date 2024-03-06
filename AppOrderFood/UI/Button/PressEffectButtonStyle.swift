//
//  SwiftUIView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 06/03/2024.
//

import SwiftUI
struct PressEffectButtonStyle: ButtonStyle {
    var backgroundColor: Color 
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.6 : 1.0)
            .animation(.easeInOut, value: configuration.isPressed)
    }
}
