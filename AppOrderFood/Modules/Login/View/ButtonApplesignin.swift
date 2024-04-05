//
//  ButtonApplesignin.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/04/2024.
//

import SwiftUI
import AuthenticationServices
struct ButtonApple_ignin: View {
    @AppStorage("email") var email: String = ""
    @AppStorage("fistname") var fistname: String = ""
    @AppStorage("lastname") var lastname: String = ""
    @AppStorage("userID") var userID: String = ""
    var body: some View {
        Text(userID)
        if userID.isEmpty {
            SignInWithAppleButton(.continue) { request in
                    request.requestedScopes = [.email,.fullName]
            } onCompletion: { result in
                    switch result {
                    case .success(let authorization):
                        switch authorization.credential{
                            
                            
                        case let credential as ASAuthorizationAppleIDCredential:
                            print("vô result")
                            let userID = credential.user
                            let email = credential.email
                            let fistname = credential.fullName?.givenName
                            let lastname = credential.fullName?.familyName
                            self.email = email ?? ""
                            self.fistname = fistname ?? ""
                            self.lastname = lastname ?? ""
                            self.userID = userID
                            
                            print(userID)
                            break
                        default:
                            break
                        }
                        
                    case .failure(let error):
                        print("fail")
                        break
                    }
                }
            .frame(height: 45)
        }else {
            WelcomeView()
        }
       
    }
}

#Preview {
    ButtonApple_ignin()
}
