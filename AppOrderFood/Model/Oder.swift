//
//  Oder.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 17/04/2024.
//
import Foundation
import FirebaseFirestore
import Firebase
enum StatusPayment: Codable {
    case active
    case inactive(reason: String)
}
enum Payment: Codable {
    case cash
    case applePay
    case crypto
}

struct Oder: Codable {
    var name: String
    var adress: String
    var total: Double
    var discount :  String
    var date: Timestamp
    var products : [Product]
    var status : StatusPayment
    var payment : Payment
}
