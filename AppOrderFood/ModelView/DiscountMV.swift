//
//  DiscountMV.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 17/04/2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class DiscountMV: ObservableObject{
    @Published var  discounts : [Discount] = []
    
    func addDiscount(value: Discount) {
        let db = Firestore.firestore()
        
        let collectionRef = db.collection("discounts").document()
        do {
            try collectionRef.setData(from: value) // Sử dụng value: Discount thay vì value: Product
            print("Discount stored with new document reference: \(collectionRef.documentID)")
        } catch {
            print("Error adding discount: \(error)")
        }
    }

    func fetchDiscount(completion: @escaping ([Discount]) -> Void) {
        let db = Firestore.firestore()
        let collectionDiscount = db.collection("discounts")
        
        collectionDiscount.getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
                completion([])
            } else {
                var discounts: [Discount] = [] // Sử dụng mảng Discount thay vì mảng Product
                for document in querySnapshot!.documents {
                    do {
                        var discount: Discount = try document.data(as: Discount.self)
                        discounts.append(discount)
                    } catch let error {
                        print("Error decoding document: \(error)")
                    }
                }
                completion(discounts)
            }
        }
    }
}
//if let error = error {
//    print("Error getting documents: \(error)")
//    completion([])
//} else {
//    for document in querySnapshot!.documents {
//        do {
//            var product: Product = try document.data(as: Product.self)
//            products.append(product)
//            
//        } catch let error {
//            print("Error decoding document: \(error)")
//        }
//    }
//    let totalPrice = products.reduce(0.0) { $0 + ($1.price * Double($1.quality)) }
//                    self.total = totalPrice
//    completion(products)
//}
