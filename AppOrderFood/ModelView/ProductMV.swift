//
//  ProductMV.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 13/04/2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class ProductMV : ObservableObject {
    
    func addProduct(value: Product, category: String) {
        
        let db = Firestore.firestore()
        
        let collectionRef = db.collection("categories").document(category)
        let productCollectionRef = collectionRef.collection("product").document()
        do {
            let newDocReference = try productCollectionRef.setData(from: value)
            print("Book stored with new document reference: \(newDocReference)")
          }
          catch {
            print(error)
          }
    
    }
    func fetchProductByCategory(category: String, completion: @escaping ([Product]) -> Void) {
        let db = Firestore.firestore()
        let collectionProduct = db.collection("categories").document(category).collection("product")
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
                completion(products)
            }
        }
    }   
    func fetchProductsFromAllCategories(completion: @escaping ([Product]) -> Void) {
        let db = Firestore.firestore()
        let categoriesCollection = db.collection("categories")

        categoriesCollection.getDocuments { (querySnapshot, error) in
            var allProducts: [Product] = []
            var completedCount = 0 // Biến đếm số lượng vòng lặp đã hoàn thành

            if let error = error {
                print("Error getting documents: \(error)")
                completion([])
            } else {
                for categoryDocument in querySnapshot!.documents {
                    let categoryID = categoryDocument.documentID
                    let productsCollection = categoriesCollection.document(categoryID).collection("product")

                    productsCollection.getDocuments { (productQuerySnapshot, productError) in
                        if let productError = productError {
                            print("Error getting products: \(productError)")
                        } else {
                            for productDocument in productQuerySnapshot!.documents {
                                do {
                                    let product: Product = try productDocument.data(as: Product.self)
                                    allProducts.append(product)
                                    print(product)
                                } catch let error {
                                    print("Error decoding document: \(error)")
                                }
                            }
                        }

                        completedCount += 1

                        if completedCount == querySnapshot!.documents.count {
                            // Nếu tất cả các vòng lặp đã kết thúc, gọi completion
                            completion(allProducts)
                        }
                    }
                }
            }
        }
    }

}
