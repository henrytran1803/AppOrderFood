//
//  OrderMV.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 19/04/2024.
//
import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore
class OrderMV :ObservableObject {
    func addOrder(value: Oder) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let userDocumentRef = db.collection("users").document(userId)
        userDocumentRef.getDocument {  (document, error) in
            
            if let error = error {
                print("Error fetching user document: (error.localizedDescription)")
                return
            }
            
            guard let document = document, document.exists else {
                print("User document does not exist")
                return
            }
            
            let data = document.data()
            if let firstName = data?["firstName"] as? String,
               let lastName = data?["lastName"] as? String,
               let address = data?["address"] as? String {
                var updatedOrder = value
                updatedOrder.name = firstName + " " + lastName
                updatedOrder.adress = address
                
                let documentCart = userDocumentRef.collection("orders").document()
                do {
                    try documentCart.setData(from: updatedOrder)
                    print("Order stored with new document reference: (documentCart.documentID)")
                } catch {
                    print("Error adding order: (error)")
                }
            } else {
                print("User data is incomplete or missing")
            }
        }
    }
}
