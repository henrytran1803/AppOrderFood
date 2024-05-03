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
    func updateCategoryName(oldName: String, newName: String, value: Categories) {
        let db = Firestore.firestore()
        
        let collectionRef = db.collection("categories")
        let oldDocRef = collectionRef.document(oldName)
        let newDocRef = collectionRef.document(newName)
        
        oldDocRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let data = document.data() ?? [:]
                newDocRef.setData(data) { error in
                    if let error = error {
                        print("Error updating document: \(error)")
                    } else {
                        print("Document successfully updated")
                        oldDocRef.delete { error in
                            if let error = error {
                                print("Error removing document: \(error)")
                            } else {
                                print("Old document successfully removed")
                            }
                        }
                    }
                }
            } else {
                print("Document does not exist")
            }
        }
    }


    func fetchDocumentNames(completion: @escaping ([String]) -> Void) {
        let db = Firestore.firestore()
        db.collection("categories").getDocuments { (querySnapshot, err) in
            var documentNames: [String] = []
            if let err = err {
                print("Error getting documents: (err)")
                completion([])
            } else {
                for document in querySnapshot!.documents {
                    documentNames.append(document.documentID)
                }
                
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

