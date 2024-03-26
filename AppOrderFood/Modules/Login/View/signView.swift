//
//  signView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 26/03/2024.
//

import SwiftUI

struct signView: View {
    @State private var show  = false
    @State private var username = ""
    @State private var password = ""
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
                if !show{
                    theText
                }else {
                    VStack{
                        Spacer()
                        Text("Chào mừng quay trở lại")
                            .bold()
                            .font(.title)
                            .foregroundColor(.primary)
                        Text("Đăng nhập để được ăn ngon nhé")
                            .foregroundColor(.secondary)
                        Spacer()
                        TextField("User name", text:$username)
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
                        TextField("Password", text:$password)
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
                        
                }
            }
               
            
        }
        .ignoresSafeArea()
        .onTapGesture {
            withAnimation{
                show.toggle()
            }
        }
    }
}

#Preview {
    signView()
}
var theText :some View{
    VStack{
        Text("Chào mừng!")
            .font(.title)
            .bold()
            .padding()
        Text("Đã có tài khoản hãy đăng nhập")
            .foregroundStyle(.secondary)
        ButtonStyleWelcome(icon: "", title: "Đăng nhập"){
            
        }
        .padding(.bottom)
        Text("Chưa có tài khoản hãy đăng ký")
            .foregroundStyle(.secondary)
        ButtonStyleWelcome(icon: "", title: "Đăng ký"){
            
        }
        
    }.padding()
}
