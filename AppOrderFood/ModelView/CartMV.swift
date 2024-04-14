//
//  CartMV.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 14/04/2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


class CartMV : ObservableObject {
    @Published var total: Double = 0.0
    func totalProduct() -> Double{
        self.fetchProductCart { products in
            DispatchQueue.main.async {
                self.total = products.reduce(0.0) { $0 + ($1.price * Double($1.quality)) }
                print(self.total)
            }
        }
        return total
    }
    func fetchProductCart(completion: @escaping ([Product]) -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let userId = currentUser.uid
        let db = Firestore.firestore()
        let collectionProduct = db.collection("users").document(userId).collection("cart")
        collectionProduct.getDocuments { (querySnapshot, error) in
            var products: [Product] = []
            if let error = error {
                print("Error getting documents: \(error)")
                completion([])
            } else {
                for document in querySnapshot!.documents {
                    do {
                        var product: Product = try document.data(as: Product.self)
                        products.append(product)
                        
                    } catch let error {
                        print("Error decoding document: \(error)")
                    }
                }
                let totalPrice = products.reduce(0.0) { $0 + ($1.price * Double($1.quality)) }
                                self.total = totalPrice
                completion(products)
            }
        }
    }
    func deleteProductCart(value: Product) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let userId = currentUser.uid
        let db = Firestore.firestore()
        let collectionProduct = db.collection("users").document(userId).collection("cart")
        
        collectionProduct.whereField("name", isEqualTo: value.name).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if let documents = querySnapshot?.documents {
                    if !documents.isEmpty {
                        let firstDocument = documents[0]
                        let documentId = firstDocument.documentID
                        
                        collectionProduct.document(documentId).delete { error in
                            if let error = error {
                                print("Error deleting document: \(error)")
                            } else {
                                print("Document successfully deleted")
                                self.fetchProductCart { products in
                                    DispatchQueue.main.async {
                                        self.total = products.reduce(0.0) { $0 + ($1.price * Double($1.quality)) }
                                        print(self.total)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    
    func addToCart(value: Product, completion: @escaping () -> Void) {
        guard let currentUser = Auth.auth().currentUser else {
            print("No current user")
            return
        }
        
        let userId = currentUser.uid
        let db = Firestore.firestore()
        let collectionProduct = db.collection("users").document(userId).collection("cart")
        collectionProduct.whereField("name", isEqualTo: value.name).getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: (error)")
            } else {
                if let documents = querySnapshot?.documents, !documents.isEmpty {
                    let firstDocument = documents.first!
                    let documentId = firstDocument.documentID
                    collectionProduct.document(documentId).setData(value.toDictionary()) { error in
                        if let error = error {
                            print("Error updating document: (error)")
                        } else {
                            print("Document updated successfully")
                            self.fetchProductCart { products in
                                DispatchQueue.main.async {
                                    self.total = products.reduce(0.0) { $0 + ($1.price * Double($1.quality)) }
                                    print(self.total)
                                }
                            }
                            completion()
                        }
                    }
                } else {
                    collectionProduct.addDocument(data: value.toDictionary()) { error in
                        if let error = error {
                            print("Error adding document: (error)")
                        } else {
                            print("Product added to cart successfully")
                            self.fetchProductCart { products in
                                DispatchQueue.main.async {
                                    self.total = products.reduce(0.0) { $0 + ($1.price * Double($1.quality)) }
                                    print(self.total)
                                }
                            }
                            completion()
                        }
                    }
                }
            }
        }
    }

    
}
extension Product {
    func toDictionary() -> [String: Any] {
        return [
            "name": name,
            "detail": detail,
            "image" : image,
            "price": price,
            "quality":quality,
            "star": star
        ]
    }
}
