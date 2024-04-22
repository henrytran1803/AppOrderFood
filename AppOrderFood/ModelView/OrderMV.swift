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
                    UserDefaults.standard.set(documentCart.documentID, forKey: "order")
                    print("Order stored with new document reference: \(documentCart.documentID)")
                } catch {
                    print("Error adding order: (error)")
                }
            } else {
                print("User data is incomplete or missing")
            }
        }
    }
    func getOrder(document: String, completion: @escaping (Oder?) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            completion(nil)
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let userDocumentRef = db.collection("users").document(userId)
        let orderDocumentRef = userDocumentRef.collection("orders").document(document)
        
        orderDocumentRef.getDocument { (document, error) in
            if let error = error {
                print("Error fetching order document: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let document = document, document.exists else {
                print("Order document does not exist")
                completion(nil)
                return
            }
            do {
                let order = try document.data(as: Oder.self)
                completion(order)
            } catch {
                print("Error parsing order data: \(error.localizedDescription)")
                completion(nil)
            }

        }
    }
    
    func fetchAllOrder(completion: @escaping ([Oder]) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let userDocumentRef = db.collection("users").document(userId)
        let orderDocumentRef = userDocumentRef.collection("orders")
        
        orderDocumentRef.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching orders: \(error.localizedDescription)")
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No documents found")
                return
            }
            
            var orders : [Oder] = []
            
            for document in querySnapshot!.documents {
                do {
               var order: Oder = try document.data(as: Oder.self)
                    orders.append(order)
                    
                } catch let error {
                    print("Error decoding document: \(error)")
                }
            }
            completion(orders)
     
        }
    }


    func deleteDocument() {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let userDocumentRef = db.collection("users").document(userId)
        let orderDocumentRef = userDocumentRef.collection("cart")

        orderDocumentRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                return
            }

            guard let documents = snapshot?.documents else {
                print("No documents to delete")
                return
            }

            let batch = db.batch()
            for doc in documents {
                batch.deleteDocument(doc.reference)
            }

            batch.commit { error in
                if let error = error {
                    print("Error deleting documents: \(error)")
                } else {
                    print("Documents successfully deleted!")
                }
            }
        }
    }
    
    func fetchDoneOrdersCount(completion: @escaping (Int) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let userDocumentRef = db.collection("users").document(userId)
        let orderDocumentRef = userDocumentRef.collection("orders")
        
        // Query to get done orders
        let doneOrdersQuery = orderDocumentRef.whereField("status", isEqualTo: "done")
        
        doneOrdersQuery.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching done orders: \(error.localizedDescription)")
                completion(0)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No done orders found")
                completion(0)
                return
            }
            
            // Return the count of done orders
            completion(documents.count)
        }
    }
    func fetchDoneOrdersCountDone(completion: @escaping (Int) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let userDocumentRef = db.collection("users").document(userId)
        let orderDocumentRef = userDocumentRef.collection("orders")
        
        // Query to get done orders
        let doneOrdersQuery = orderDocumentRef.whereField("status", isEqualTo: "done")
        
        doneOrdersQuery.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching done orders: \(error.localizedDescription)")
                completion(0)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No done orders found")
                completion(0)
                return
            }
            
            // Return the count of done orders
            completion(documents.count)
        }
    }
    func fetchDoneOrdersCountFail(completion: @escaping (Int) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let userDocumentRef = db.collection("users").document(userId)
        let orderDocumentRef = userDocumentRef.collection("orders")
        
        // Query to get done orders
        let doneOrdersQuery = orderDocumentRef.whereField("status", isEqualTo: "no")
        
        doneOrdersQuery.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error fetching done orders: \(error.localizedDescription)")
                completion(0)
                return
            }
            
            guard let documents = querySnapshot?.documents else {
                print("No done orders found")
                completion(0)
                return
            }
            
            // Return the count of done orders
            completion(documents.count)
        }
    }
    func update() {
        let status: StatusPayment = .done
        let docu: String = UserDefaults.standard.string(forKey: "order") ?? "none"
        
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let db = Firestore.firestore()
        let userId = currentUser.uid
        let userDocumentRef = db.collection("users").document(userId)
        let orderDocumentRef = userDocumentRef.collection("orders").document(docu)
        
        orderDocumentRef.setData(["status": status.rawValue], merge: true) { error in
            if let error = error {
                print("Error updating document: \(error.localizedDescription)")
            } else {
                print("Document updated successfully")
            }
        }
    }



}
