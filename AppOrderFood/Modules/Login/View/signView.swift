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
    @State private var username = ""
    @State private var password = ""
    @State private var repeatpassword = ""
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
                                isSignin.toggle()
                                show .toggle()
                        }
                        .padding(.bottom)
                        Text("Chưa có tài khoản hãy đăng ký")
                            .foregroundStyle(.secondary)
                        ButtonStyleWelcome(icon: "", title: "Đăng ký"){
                                isSignup.toggle()
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
                            .opacity(show ? 1 :0)
                            .scaleEffect(show ? 1 : 0.8)
                    }
                    
                    if isSignup {
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
                            Text("Đăng ký tài khoản mới")
                                .bold()
                                .font(.title)
                                .foregroundColor(.primary)
                            Text("Đăng ký ngay để được ăn ngon nhé")
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
                            SecureField("Password", text:$password)
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
                            SecureField("Repeat password", text:$repeatpassword)
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
                    if isforgotpasss {
                        VStack{
                            HStack{
                                Button(action: {
                                        show.toggle()
                                    isforgotpasss.toggle()
                                }, label: {
                                    Image(systemName: "arrow.backward")
                                        .resizable()
                                        .frame(width: 30,height: 30)
                                        .foregroundStyle(.black)
                                }).padding()
                                
                                Spacer()
                            }
                            Spacer()
                            Text("Quên mất mật khẩu rồi")
                                .bold()
                                .font(.title)
                                .foregroundColor(.primary)
                            Text("Lấy nhanh còn đặt đồ này")
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
                        Spacer()
                            ButtonStyleWelcome(icon: "", title: "Gửi mã xác nhận"){
                                
                            }.padding()
                        }.padding()
                            .opacity(show ? 1 :0)
                            .scaleEffect(show ? 1 : 0.8)
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
