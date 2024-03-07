//
//  DetailProductModel.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import Foundation
struct DetailProductModel {
    let id: UUID
    let name: String
    let category : String
    let image : String
    let price: Double
    let quality: Int
    init(id: UUID, name: String, category: String, image: String, price: Double, quality: Int) {
        self.id = id
        self.name = name
        self.category = category
        self.image = image
        self.price = price
        self.quality = quality
    }
}


struct MockDetailProduct {
    static let product = DetailProductModel(id: UUID(), name: "Hamburger sieu to", category: "hamburger", image: "hamburger", price: 100, quality: 20)
    
    
    
}
