//
//  SigninView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI

struct SigninView: View {
    @Binding var show : Bool
    @Binding var isSignin : Bool
    @State var userName = ""
    @State var passWord = ""
    @State var repeatPassword = ""
    @State var isShowingSignup = false
    @State var signIn = false
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                        show.toggle()
                        isSignin.toggle()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .foregroundStyle(.black)
                }).padding()
                
                Spacer()
            }

            Spacer()
            Text("Đăng ký tài khoản mới")
                .bold()
                .font(.title)
                .foregroundColor(.primary)
            Text("Đăng ký ngay để được ăn ngon nhé")
                .foregroundColor(.secondary)
            Spacer()
            TextField("User name", text:$userName)
                .padding()
                .background(Color(.white))
                .cornerRadius(8)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.1)
                        .foregroundStyle(.black)
                }
            SecureField("Password", text:$passWord)
                .padding()
                .background(Color(.white))
                .cornerRadius(8)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.1)
                        .foregroundStyle(.black)
                }
            SecureField("Repeat password", text:$repeatPassword)
                .padding()
                .background(Color(.white))
                .cornerRadius(8)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.1)
                        .foregroundStyle(.black)
                }

        Spacer()
            ButtonStyleWelcome(icon: "", title: "Đăng nhập"){
                
            }.padding()
        }.padding()
            .opacity(show ? 1 :0)
            .scaleEffect(show ? 1 : 0.8)
    }
}

#Preview {
    SigninView(show: .constant(false), isSignin: .constant(true))
}
