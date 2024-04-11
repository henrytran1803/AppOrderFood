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
    func createUser(email: String , password: String, completion: @escaping (Bool, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                completion(false, error)
            } else {
                completion(true, nil)
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

class InfoUser {
    func fetchUserFromFirestore() async -> User {
        if let currentUser = Auth.auth().currentUser {
            guard let email = currentUser.email else {
                print("Không thể lấy địa chỉ email của người dùng.")
                return User(fistName: "", lastName: "", email: "", address: "", dateOfBirth: Date())
            }

            let db = Firestore.firestore()
            let userRef = db.collection("users").document(email)

            do {
                let document = try await userRef.getDocument()
                if document.exists {
                    if let userData = document.data() {
                        return User(from: userData, email: email) ?? User(fistName: "", lastName: "", email: "", address: "", dateOfBirth: Date())
                    } else {
                        print("Dữ liệu không hợp lệ.")
                    }
                } else {
                    print("Tài liệu không tồn tại")
                }
            } catch {
                print("Lỗi khi lấy tài liệu: \(error)")
            }
        } else {
            print("Không có người dùng hiện tại.")
        }
        return User(fistName: "", lastName: "", email: "", address: "", dateOfBirth: Date())
    }
}

