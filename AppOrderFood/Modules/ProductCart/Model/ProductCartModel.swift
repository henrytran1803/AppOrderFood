//
//  ProductCart.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 08/03/2024.
//

import Foundation
import SwiftData

struct ProductCartModel:Identifiable {
    var id: UUID
    var name: String
    var image: String
    var category : String
    var quality : Int
    var price : Double
    var size : String
    init(id: UUID, name: String, image: String, category: String, quality: Int, price: Double, size: String) {
        self.id = id
        self.name = name
        self.image = image
        self.category = category
        self.quality = quality
        self.price = price
        self.size = size
    }
}
struct MockProductCartModel {
    static var product1 = ProductCartModel(id: UUID(), name: "hamburger bu vai", image: "hamburger", category: "hamburger", quality: 10, price: 1000, size: "S")
    static var product2 = ProductCartModel(id: UUID(), name: "hamburger bu vai", image: "hamburger", category: "hamburger", quality: 10, price: 1000, size: "S")
    static var product3 = ProductCartModel(id: UUID(), name: "hamburger bu vai", image: "hamburger", category: "hamburger", quality: 10, price: 1000, size: "S")
    static var product4 = ProductCartModel(id: UUID(), name: "hamburger bu vai", image: "hamburger", category: "hamburger", quality: 10, price: 1000, size: "S")
    static var product5 = ProductCartModel(id: UUID(), name: "hamburger bu vai", image: "hamburger", category: "hamburger", quality: 10, price: 1000, size: "S")
    static var product6 = ProductCartModel(id: UUID(), name: "hamburger bu vai", image: "hamburger", category: "hamburger", quality: 10, price: 1000, size: "S")
}
