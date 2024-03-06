//
//  LoginView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI

struct LoginView: View {
    @State var userName = ""
    @State var passWord = ""
    @State var isShowingSignin = false
    @State var isShowingForgotPassword = false
    var body: some View {
        VStack{
            Spacer()
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
            Spacer()
            Text("WELCOME BACK!")
                .font(.system(size: 40).bold())
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.629, green: 0.824, blue: 0.979)/*@END_MENU_TOKEN@*/)
            Spacer()
            TextField("UserName", text: $userName)
                .padding()
                .background(Color("textField").opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)

            TextField("PassWord", text: $passWord)
                .padding()
                .background(Color("textField").opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)
            Spacer()
            VStack{
                Button("Forgot password?"){
                    isShowingForgotPassword = true
                }.foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.149, green: 0.388, blue: 0.588)/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 15).bold())
                Button("SIGN UP"){
                    
                }//.buttonStyle(.borderedProminent)
                    .font(.system(size: 20).bold())
                    .buttonStyle(PressEffectButtonStyle(backgroundColor:Color(hue: 0.535, saturation: 0.779, brightness: 0.677)))

                HStack{
                    Text("Don't have an account?")
                        .font(.system(size: 15))
                    Button("Sign in"){
                        isShowingSignin = true
                    }.foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.149, green: 0.388, blue: 0.588)/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 15).bold())

                }
            }
        }  .fullScreenCover(isPresented: $isShowingSignin) {
            SigninView()
        }
        .fullScreenCover(isPresented: $isShowingForgotPassword) {
          ForgotPasswordView()
      }
    }
}

#Preview {
    LoginView()
}
