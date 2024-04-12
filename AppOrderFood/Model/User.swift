//
//  User.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 11/04/2024.
//

import Foundation
import FirebaseFirestore
import Firebase


struct User: Codable {
    var firstName: String
    var lastName: String
    var email: String
    var address: String
    var dateOfBirth: Timestamp
}
