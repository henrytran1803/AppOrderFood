//
//  TrackingView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/04/2024.
//

import SwiftUI

struct TrackingView: View {
    @State var order : Oder
    @State var isShow = false
    @State var height: CGFloat = 0.7
    @State var height2: CGFloat = 0.1
    @State var back = false
    @State var isAdd = false
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        let screenHeight = screenSize.height
        ZStack{
            
            VStack{
                HStack{
                    Button(action: {back = true}, label: {
                        Text("Back")
                    })
                    Spacer()
                }
                MapView(height: $height, isAdd: $isAdd)
                    .animation(.easeInOut(duration: 0.5))
                Spacer()
            }
            Status(order: $order, height: $height2)
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
        .fullScreenCover(isPresented: $back, content: {
            TabView()
        })
    }
    
}

//#Preview {
//    TrackingView(order: Oder(name: "", adress: "", total: 10, discount: 10, date: <#T##Timestamp#>, products: [], status: .done, payment: .applePay))
//}
