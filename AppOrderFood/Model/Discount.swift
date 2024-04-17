//
//  Discount.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 17/04/2024.
//
import Foundation
import FirebaseFirestore
import Firebase


struct Discount: Codable {
    var code: String
    var name: String
    var percent: Double
    var dueday: Timestamp
    var image: String
}
