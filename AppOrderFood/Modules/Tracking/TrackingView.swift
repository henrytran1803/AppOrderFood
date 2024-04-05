//
//  TrackingView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/04/2024.
//

import SwiftUI

struct TrackingView: View {
    @State var isShow = false
    @State var height: CGFloat = 0.7
    @State var height2: CGFloat = 0.1
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        let screenHeight = screenSize.height
        ZStack{
            VStack{
                MapView(height: $height)
                    .animation(.easeInOut(duration: 0.5))
                Spacer()
            }
                Status(height: $height2)
                .offset(y: isShow ? screenHeight * 0.35 : screenHeight * 0.56)
                    .animation(
                        Animation.easeInOut(duration: 0.8)
                    )
        }
       
           

        .onTapGesture {
            isShow.toggle()
            if isShow {
                height = 0.53
                height2 = 0.3
            } else {
                height = 0.7
                height2 = 0.1
            }
        }
    }
}

#Preview {
    TrackingView()
}
