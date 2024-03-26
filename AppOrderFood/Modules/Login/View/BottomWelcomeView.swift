//
//  BottomWelcomeView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 26/03/2024.
//

import SwiftUI

struct BottomWelcomeView: View {
    @State private var show = false
    @Binding var Dshow: Bool
    var body: some View {
        
        VStack{
            Spacer()
            Text("ORDER FOOD")
                .font(show ? .title2 : .system(size: 60))
                .foregroundColor(.white)
            Group{
                Text("Đặt đồ ăn nhanh chóng")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                Text("Giao nhanh")
                    .font(.title)
                    .foregroundColor(.white)
                ButtonStyleWelcome(icon: "", title: "Bắt đầu"){
                    Dshow.toggle()
                }.padding(.horizontal)
            }
        }.opacity(show ? 1 :0)
            .scaleEffect(show ? 1 : 0.8)
        .offset(y: show ? -30 : 100)
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now()+3)
            {
                withAnimation{
                    show.toggle()
                }
            }
        }
        .opacity(Dshow ? 0 :1)
        .scaleEffect(Dshow ? 0.8 : 1)
    }
}

#Preview {
    BottomWelcomeView( Dshow: .constant(false))
}
