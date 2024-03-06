//
//  GettingstartedView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI
//import SplineRuntime
struct GettingstartedView: View {
    @State var isShowingLogin = false
    var body: some View {
        VStack{
            HStack{
                Image("cloud1")
                Image("cloud2")
            }
            Image("welcome")
                .foregroundColor(.secondary)
                .frame(height: 300)
                .ignoresSafeArea()
            VStack(spacing: 12){
                Text("WELCOME TO ORDER FOOD")
                    .font(.title.bold())
                Text("An uong tuy thich khong lo ve gia")
                    .foregroundColor(.secondary)
            }.padding(.horizontal)
            Spacer()
            Button("Getting started"){
                isShowingLogin = true
            }//.buttonStyle(.borderedProminent)
                .font(.system(size: 20).bold())
                .buttonStyle(PressEffectButtonStyle(backgroundColor:Color(Color.pink)))
                
                .frame(width: 250,height: 100)
            
        }        .fullScreenCover(isPresented: $isShowingLogin) {
            LoginView()
        }
    }
}

#Preview {
    GettingstartedView()
}
