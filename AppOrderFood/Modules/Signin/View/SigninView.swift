//
//  SigninView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI
import Firebase


struct SigninView: View {
    @Binding var show : Bool
    @Binding var isSignin : Bool
    @State var userName = ""
    @State var phone = ""
    @State var passWord = ""
    @State var repeatPassword = ""
    @State var isShowingSignup = false
    @State var signIn = false
    @State var showNoti = false
    @State var sentOTP = false
    @State var otp = ""
    @State var vercation = ""
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
            TextField("Email", text:$userName)
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
            HStack{
                Text("+84")
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
                    .frame(width: 60)

                TextField("PhoneNumber", text:$phone)
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
                    .frame(width: 250)
                Button(action: {
                    sentOTP = true
                    AuthManager.shared.sendOTP(to: phone){success,verctionID, error in
                        if success {
                            vercation = verctionID ?? ""
                        }
                    }
                    
                }, label: {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color.bgproduct)
                        .overlay{
                            Text("Sent OTP")
                                .foregroundStyle(.white)
                                .bold()
                        }
                    
                })
            }
            HStack{
                let description = strengthDescription()
                Rectangle()
                    .frame(width: description.2,height: 1)
                    .foregroundColor(description.1)
                    .animation(.easeInOut)
                Text(description.0)
                    .foregroundStyle(.secondary)
                    .font(.system(size: 15))
                Spacer()
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
            if sentOTP {
                TextField("OTP", text:$otp)
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
            }
        Spacer()
            ButtonStyleWelcome(icon: "", title: "Đăng ký"){
                if checkPass() {
                    if sentOTP {
                        if vercation != ""{
                            AuthManager.shared.signUp(email: userName, password: passWord, otp: otp, verificationID: vercation){ sucess, errr in
                                if sucess {
                                    show.toggle()
                                    isSignin.toggle()
                                }
                            }
                        }
                    }
                    
                }else {
                    showNoti = true
                }
            }.padding()
        }.padding()
            .opacity(show ? 1 :0)
            .scaleEffect(show ? 1 : 0.8)
            .alert("Important message: wrong pass", isPresented: $showNoti) {
                        Button("OK", role: .cancel) { }
                    }
    }
    func checkPass() -> Bool {
        if self.passWord != self.repeatPassword{
            return false
        }
        return true
    }
    private func strengthDescription() -> (String, Color, CGFloat) {
        let strength = PasswordStrengthChecker.checkStrength(passWord)
        switch strength {
        case .weak:
            return ("Yếu", Color.red, 50)
        case .moderate:
            return ("Vừa", Color.orange, 100)
        case .strong:
            return ("Mạnh", Color.green, 150)
        }
    }


}


enum PasswordStrength {
    case weak
    case moderate
    case strong
}

struct PasswordStrengthChecker {
    static func checkStrength(_ password: String) -> PasswordStrength {
        var score = 0
        
        // Kiểm tra độ dài của mật khẩu
        if password.count >= 8 {
            score += 1
        }
        
        // Kiểm tra xem mật khẩu có chứa ít nhất một chữ cái in hoa không
        let uppercaseLetterRegex = ".*[A-Z]+.*"
        if NSPredicate(format: "SELF MATCHES %@", uppercaseLetterRegex).evaluate(with: password) {
            score += 1
        }
        
        // Kiểm tra xem mật khẩu có chứa ít nhất một ký tự đặc biệt không
        let specialCharacterRegex = ".*[^A-Za-z0-9]+.*"
        if NSPredicate(format: "SELF MATCHES %@", specialCharacterRegex).evaluate(with: password) {
            score += 1
        }
        
        // Dựa vào số điểm, xác định sức mạnh của mật khẩu
        switch score {
        case 0...1:
            return .weak
        case 2:
            return .moderate
        default:
            return .strong
        }
    }
}

#Preview {
    SigninView(show: .constant(true), isSignin: .constant(true))
}
