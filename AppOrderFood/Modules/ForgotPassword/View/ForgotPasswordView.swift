//
//  ForgotPasswordView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Binding var show : Bool
    @Binding var isforgotpasss : Bool
    @State var userName = ""
    @State var isCorrectUserName = false
    @State var isShowingOTP = false
    @State var ishowAlert = false
    var body: some View {
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
        Spacer()
            ButtonStyleWelcome(icon: "", title: "Đặt lại mật khẩu"){
                InfoUser().sendPasswordReset(withEmail: userName) { error in
                    if let error = error {
                        print("Lỗi khi gửi yêu cầu đặt lại mật khẩu: \(error.localizedDescription)")
                    } else {
                        ishowAlert = true
                    }
                }
            }.padding()
        }.padding()
            .opacity(show ? 1 :0)
            .scaleEffect(show ? 1 : 0.8)
            .alert(isPresented: $ishowAlert) {
                        // Hiển thị cảnh báo
                        Alert(
                            title: Text("Reset email"),
                            message: Text("Đã gửi email về kiểm tra email \(userName)."),
                            primaryButton: .default(Text("Back home")) {
         
                                show = false
                            },
                            secondaryButton: .cancel()
                        )
                    }
    }
}

#Preview {
    ForgotPasswordView(show: .constant(true), isforgotpasss: .constant(false))
}
