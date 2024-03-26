//
//  WelcomeView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 26/03/2024.
//

import SwiftUI
import AVKit
import AVFoundation

struct WelcomeView: View {
    @State var Dshow = false
    var body: some View {
        ZStack {
            PlayerView()
                .edgesIgnoringSafeArea(.all)

           BottomWelcomeView(Dshow: $Dshow)
            if Dshow{
                signView()
                    .opacity(Dshow ? 0.95 :0)
                        .scaleEffect(Dshow ? 1 : 0.8)
                        .animation(.smooth, value: Dshow)
                
            }
        }
    }
    
}

#Preview {
    WelcomeView()
}

