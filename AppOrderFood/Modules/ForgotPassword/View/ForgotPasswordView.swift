//
//  ForgotPasswordView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var userName = ""
    @State var isCorrectUserName = false
    @State var isShowingOTP = false
    @State var isBackToSignIn = false
    @State var isNotCorrectUserName = false
    var body: some View {
        VStack{
        
            HStack{
                Image("cloud1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100, alignment: .topLeading)
                Image("cloud1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 50, alignment: .topLeading)
                Spacer()
                Image("cloud2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 70, alignment: .topLeading)

            }
           
            Text("FORGOT PASSWORD")
                .font(.system(size: 40).bold())
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.629, green: 0.824, blue: 0.979)/*@END_MENU_TOKEN@*/)
            Image("otp")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 350, alignment: .topLeading)
            Spacer()
            TextField("User name", text: $userName)
                .padding()
                .background(Color("textField").opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)
            
            Button("SENT OTP"){
                if (isCorrectUserName){
                    isShowingOTP = true
                }
            }.font(.system(size: 20).bold())
            .buttonStyle(PressEffectButtonStyle(backgroundColor:Color(hue: 0.535, saturation: 0.779, brightness: 0.677)))
            .padding()
            HStack{
                Text("Back to")
                    .font(.system(size: 15))
                Button("Sign in"){
                    isBackToSignIn = true
                }.font(.system(size: 15).bold())
                    .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.149, green: 0.388, blue: 0.588)/*@END_MENU_TOKEN@*/)
            }
        }  .fullScreenCover(isPresented:$isBackToSignIn) {
            LoginView()
        }

    }
}

#Preview {
    ForgotPasswordView()
}
