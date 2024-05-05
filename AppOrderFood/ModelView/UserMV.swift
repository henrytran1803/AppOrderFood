//
//  UserMV.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 11/04/2024.
//

import Foundation

import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class AuthManager {
    static let shared = AuthManager()
    func sendOTP(to phoneNumber: String, completion: @escaping (Bool, String?, Error?) -> Void) {
        var formattedPhoneNumber = phoneNumber
        formattedPhoneNumber = formattedPhoneNumber.replacingOccurrences(of: " ", with: "")
        formattedPhoneNumber = formattedPhoneNumber.replacingOccurrences(of: "(", with: "")
        formattedPhoneNumber = formattedPhoneNumber.replacingOccurrences(of: ")", with: "")
        if !formattedPhoneNumber.hasPrefix("+") {
            formattedPhoneNumber = "+84" + formattedPhoneNumber
        }

        PhoneAuthProvider.provider().verifyPhoneNumber(formattedPhoneNumber, uiDelegate: nil) { (verificationID, error) in
            if let error = error {
                print("Error sending OTP: \(error.localizedDescription)")
                completion(false, nil, error)
                return
            }
            
            completion(true, verificationID, nil)
        }
    }



    func signUp(email: String, password: String, otp: String, verificationID: String, completion: @escaping (Bool, Error?) -> Void) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: otp)
        
        Auth.auth().signIn(with: credential) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            if let error = error {
                print("Failed to verify OTP: \(error.localizedDescription)")
                completion(false, error)
                return
            }
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print("Failed to sign up: \(error.localizedDescription)")
                    completion(false, error)
                    return
                }
                
                let currentUser = Auth.auth().currentUser
                currentUser?.updatePhoneNumber(credential) { error in
                    if let error = error {
                        print("Error linking phone number: \(error.localizedDescription)")
                        completion(false, error)
                        return
                    }
                    
                    completion(true, nil)
                }
            }
        }
    }

    
    func signIn(email: String , password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if let error = error {
                            print("Failed to sign in: \(error.localizedDescription)")
                            completion(false, error)
                        } else {
                            print("User signed in successfully!")
                            completion(true, nil)
                }
        }
    }

}
enum UserError: Error {
    case invalidEmail
    case documentNotFound
    case invalidData
    case invalidUser
    case noCurrentUser
}

class InfoUser: ObservableObject {
    @Published var user: User = User(firstName: "", lastName: "", email: "", address: "", dateOfBirth: Timestamp(date: Date()),role: "")
    @Published var errorMessage: String?
    
    func fetchUser() {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let docRef = db.collection("users").document(userId)
        docRef.getDocument { document, error in
            if let document = document, document.exists {
                do {
                    self.user = try document.data(as: User.self)
                    print(self.user)
                    self.errorMessage = nil
                } catch let error {
                    print("Error decoding document: \(error)")
                    self.errorMessage = "Error decoding document: \(error.localizedDescription)"
                }
            } else {
                print("Document does not exist")
                self.errorMessage = "Document does not exist"
            }
        }
    }
    func reloadUser() {
        fetchUser()
        
    }

    func checkRoleUser(uid: String, completion: @escaping (String?) -> Void) {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                if let role = document.data()?["role"] as? String {
                    print("Role của người dùng có UID \(uid) là: \(role)")
                    completion(role)
                } else {
                    print("Không tìm thấy trường 'role' hoặc kiểu dữ liệu không phù hợp")
                    completion(nil)
                }
            } else {
                print("Tài liệu không tồn tại hoặc có lỗi xảy ra: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
            }
        }
    }

    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            callback?(error)
        }
    }
}
