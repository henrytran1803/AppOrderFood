//
//  User.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 11/04/2024.
//

import Foundation
import FirebaseFirestore

struct User: Encodable, Decodable {
    var fistName: String
    var lastName: String
    var email: String
    var address: String
    var dateOfBirth: Date
    init(fistName: String, lastName: String, email: String, address: String, dateOfBirth: Date) {
        self.fistName = fistName
        self.lastName = lastName
        self.email = email
        self.address = address
        self.dateOfBirth = dateOfBirth
    }
    init?(from firestoreData: [String: Any], email: String) {
        guard let fistName = firestoreData["fistname"] as? String,
              let lastName = firestoreData["lastname"] as? String,
              let address = firestoreData["address"] as? String,
              let dateofbirthTimestamp = firestoreData["dateofbirth"] as? Timestamp else {
            return nil
        }
        
        self.fistName = fistName
        self.lastName = lastName
        self.email = email
        self.address = address
        self.dateOfBirth = dateofbirthTimestamp.dateValue()
    }
}
