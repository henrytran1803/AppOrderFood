//
//  ProductModel.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import Foundation
struct ProductModel: Identifiable {
    let id: UUID
    let name: String
    let category: String
    let image : String
    let price: Double
    init(id: UUID, name: String, category: String, image: String, price: Double) {
        self.id = id
        self.name = name
        self.category = category
        self.image = image
        self.price = price
    }
}

struct MockProduct {
    static let product1 = ProductModel(id: UUID(), name: "Double cheese", category: "hamburger", image: "hamburger", price: 200.1)
    static let product2 = ProductModel(id: UUID(), name: "Double cheese", category: "pizza", image: "pizza", price: 200.1)
    static let product3 = ProductModel(id: UUID(), name: "Double cheese", category: "drink", image: "drink", price: 200.1)
}
