//
//  LoginView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @Binding var show : Bool
    @Binding var isSignup : Bool
    @State var userName = ""
    @State var passWord = ""
    @State var isLoginSuccess = false
    @State var alert = false
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
        Spacer()
            ButtonStyleWelcome(icon: "", title: "Đăng nhập"){
                AuthManager.shared.signIn(email: userName, password: passWord) { success, error in
                    if success {
                        if let user = Auth.auth().currentUser {
                            let uid = user.uid
                            let email = user.email
                            let photoURL = user.photoURL
                            
                            let userData: [String: Any] = [
                                "uid": uid,
                                "email": email ?? "",
                                "photoURL": photoURL?.absoluteString ?? ""
    
                            ]
                            InfoUser().checkRoleUser(uid: uid) { role in
                                if let role = role {
                                    print("Role của người dùng là: \(role)")
                                    UserDefaults.standard.set(role, forKey: "role")
                                } else {
                                    print("Không thể lấy được role của người dùng")
                                }
                                UserDefaults.standard.set(true, forKey: "isLogin")
                                isLoginSuccess = true
                            }
                            
                            
                        }
                        
                    } else {
                        alert = true
                    }
                }
            }.padding()
        }.padding()
            .opacity(show ? 1 :0)
            .scaleEffect(show ? 1 : 0.8)
            .fullScreenCover(isPresented: $isLoginSuccess, content: {
                
                var role = UserDefaults.standard.string(forKey: "role")
                
                if role == "admin" {
                   AdminView()
                }else {
                    TabView()
                }
                
            })
            .alert("Sai tên đăng nhập hoặc mật khẩu", isPresented: $alert) {
                        Button("OK", role: .cancel) { }
                    }
    }
}

#Preview {
    LoginView(show: .constant(false), isSignup: .constant(true))
}
