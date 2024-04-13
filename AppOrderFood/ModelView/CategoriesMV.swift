//
//  CategoriesMV.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 13/04/2024.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore


class CategoriesMV : ObservableObject {
    
    func addCategory(value: Categories, name: String) {
        
        let db = Firestore.firestore()
        
      let collectionRef = db.collection("categories").document(name)
        do {
            let newDocReference = try collectionRef.setData(from: value)
            print("Book stored with new document reference: \(newDocReference)")
          }
          catch {
            print(error)
          }
      
    }
    func fetchDocumentNames(completion: @escaping ([String]) -> Void) {
        let db = Firestore.firestore()
        db.collection("categories").getDocuments { (querySnapshot, err) in
            var documentNames: [String] = [] // Khởi tạo mảng chứa tên documents ở đây
            if let err = err {
                print("Error getting documents: (err)")
                completion([]) // Trả về một mảng rỗng nếu có lỗi
            } else {
                for document in querySnapshot!.documents {
                    documentNames.append(document.documentID)
                }
                
                // Gọi completion handler với mảng tên documents đã lấy được
                completion(documentNames)
            }
        }
    }

    
    func fetchCategoriesDetails(completion: @escaping ([CategoriesDetail]) -> Void) {
        let db = Firestore.firestore()
        db.collection("categories").getDocuments { (querySnapshot, err) in
            var categoriesDetails: [CategoriesDetail] = []
            if let err = err {
                print("Error getting documents: (err)")
                completion([])
            } else {
                for document in querySnapshot!.documents {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: document.data(), options: [])
//                        if let jsonString = String(data: jsonData, encoding: .utf8) {
//                                print(jsonString)
//                            }
                        let categoryDetail = try JSONDecoder().decode(Categories.self, from: jsonData)
                        categoriesDetails.append(CategoriesDetail(name: document.documentID, category: categoryDetail))
                    } catch let error {
                        print("Error decoding document: (error)")
                    }
                }
                completion(categoriesDetails)
            }
        }
    }
}

class ProductMV : ObservableObject {
    
    func addProduct(value: Product, name: String, category: String) {
        
        let db = Firestore.firestore()
        
        let collectionRef = db.collection("categories").document(category)
        let productCollectionRef = collectionRef.collection("product").document(name)
        do {
            let newDocReference = try productCollectionRef.setData(from: value)
            print("Book stored with new document reference: \(newDocReference)")
          }
          catch {
            print(error)
          }
      
    }
    
}
