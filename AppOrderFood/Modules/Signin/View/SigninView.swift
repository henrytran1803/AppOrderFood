//
//  SigninView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI

struct SigninView: View {
    @State var userName = ""
    @State var passWord = ""
    @State var repeatPassword = ""
    @State var isShowingSignup = false
    @State var signIn = false
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Image("cloud1")
                Image("cloud1")
                Spacer()
                Image("cloud2")
            }
            Spacer()
            Text("CREATE NEW!")
                .font(.system(size: 40).bold())
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.629, green: 0.824, blue: 0.979)/*@END_MENU_TOKEN@*/)
            Text("More users, more discount!")
                .foregroundColor(.secondary)
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
            TextField("Repeat Password", text:$repeatPassword)
                .padding()
                .background(Color("textField").opacity(0.3))
                .cornerRadius(8)
                .padding(.horizontal)
                .font(.system(size: 14))
                .multilineTextAlignment(.leading)
                .padding(.bottom, 20)
            Spacer()
            VStack{
                Button("SIGN IN"){
                    
                }.buttonStyle(.borderedProminent)
                    .font(.system(size: 20).bold())
                    .tint(Color(hue: 0.535, saturation: 0.779, brightness: 0.677))
                    .frame(width: 250,height: 100)
                HStack{
                    Text("Already have an account?")
                        .font(.system(size: 15))
                    Button("Sign up"){
                        isShowingSignup = true
                    }.foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.149, green: 0.388, blue: 0.588)/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 15).bold())
                              
                }
            }
        }  .fullScreenCover(isPresented:$isShowingSignup) {
            LoginView()
        }
       
    }
}

#Preview {
    SigninView()
}
