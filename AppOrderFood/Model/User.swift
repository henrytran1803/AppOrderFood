//
//  User.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 11/04/2024.
//

import Foundation

struct User: Codable {
    let id: UUID
    var name: String
    var email: String
    var pass: String
    
}
