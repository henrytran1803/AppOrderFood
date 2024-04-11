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
enum UserError: Error {
    case invalidEmail
    case documentNotFound
    case invalidData
    case invalidUser
    case noCurrentUser
}

class InfoUser : ObservableObject {
    @Published var user: User = User(fistName: "", lastName: "", email: "", address: "", dateOfBirth: .now)
        
    
    func fetchUserFromFirestore(completion: @escaping (Result<User, Error>) -> Void) {
        if let currentUser = Auth.auth().currentUser {
            guard let email = currentUser.email else {
                print("Không thể lấy địa chỉ email của người dùng.")
                completion(.failure(UserError.invalidEmail))
                return
            }
            print(email)
            let db = Firestore.firestore()
            let userRef = db.collection("users").document(email)

            userRef.getDocument { document, error in
                if let error = error {
                    print("Lỗi khi lấy tài liệu: \(error)")
                    completion(.failure(error))
                    return
                }
                
                guard let document = document, document.exists else {
                    print("Tài liệu không tồn tại")
                    completion(.failure(UserError.documentNotFound))
                    return
                }

                guard let userData = document.data() else {
                    print("Dữ liệu không hợp lệ.")
                    completion(.failure(UserError.invalidData))
                    return
                }

                if let user = User(from: userData, email: email) {
                    completion(.success(user))
                } else {
                    completion(.failure(UserError.invalidUser))
                }
            }
        } else {
            print("Không có người dùng hiện tại.")
            completion(.failure(UserError.noCurrentUser))
        }
    }
    func fetchUser() {
            InfoUser().fetchUserFromFirestore { result in
                switch result {
                case .success(let infoUser):
                    DispatchQueue.main.async {
                        self.user = infoUser
                        print(infoUser)
                    }
                case .failure(let error):
                    print("Error fetching user info: \(error)")
                }
            }
        }

}

