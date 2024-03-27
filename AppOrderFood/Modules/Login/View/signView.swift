//
//  signView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 26/03/2024.
//

import SwiftUI

struct signView: View {
    @State private var show  = false
    @State private var isSignin = false
    @State private var isSignup = false
    @State private var isforgotpasss = false
    var body: some View {
        VStack{
            if !show{
                Spacer()
            }
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, maxHeight: show ? .infinity : 400)
                    .padding(.horizontal, show ? 0 : 10)
                    .padding(.bottom, show ? 0 : 10)
                    .animation(show ? .easeIn : .easeOut, value: show)
                if !show{
                    VStack{
                        Text("Chào mừng!")
                            .font(.title)
                            .bold()
                            .padding([.leading, .bottom, .trailing])
                        Text("Đã có tài khoản hãy đăng nhập")
                            .foregroundStyle(.secondary)
                        ButtonStyleWelcome(icon: "", title: "Đăng nhập"){
                                isSignup.toggle()
                                show .toggle()
                        }
                        .padding(.bottom)
                        Text("Chưa có tài khoản hãy đăng ký")
                            .foregroundStyle(.secondary)
                        ButtonStyleWelcome(icon: "", title: "Đăng ký"){
                            isSignin.toggle()
                                show.toggle()
                        }
                        HStack{
                            Text("Bạn quên mật khẩu ư?")
                            Button("Lấy lại mật khẩu"){
                                isforgotpasss.toggle()
                                show.toggle()
                            }.bold()
                                .foregroundColor(.black)
                        }.padding(.top)
                        
                    }.padding()
                        .opacity(show ? 0 :1)
                        .scaleEffect(show ? 0.8 : 1)
                        
                }else {
                    if isSignin {
                        SigninView(show: $show, isSignin: $isSignin)
                    }
                    
                    if isSignup {
                       LoginView(show: $show, isSignup: $isSignup)
                    }
                    if isforgotpasss {
                       ForgotPasswordView(show: $show, isforgotpasss: $isforgotpasss)
                    }
                }
            }
               
            
        }
        .ignoresSafeArea()
//        .onTapGesture {
//            withAnimation{
//                $Dshow.toggle()
//            }
//        }
    }
}

#Preview {
    signView()
}
