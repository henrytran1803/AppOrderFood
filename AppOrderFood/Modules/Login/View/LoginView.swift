//
//  LoginView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI

struct LoginView: View {
    @Binding var show : Bool
    @Binding var isSignup : Bool
    @State var userName = ""
    @State var passWord = ""
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                        show.toggle()
                    isSignup.toggle()
                }, label: {
                    Image(systemName: "arrow.backward")
                        .resizable()
                        .frame(width: 30,height: 30)
                        .foregroundStyle(.black)
                }).padding()
                
                Spacer()
            }
            Spacer()
            Text("Chào mừng quay trở lại")
                .bold()
                .font(.title)
                .foregroundColor(.primary)
            Text("Đăng nhập để được ăn ngon nhé")
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
            TextField("Password", text:$passWord)
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
    LoginView(show: .constant(false), isSignup: .constant(true))
}
