//
//  Product_Cartmodel.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import Foundation

struct ProductCartModel : Hashable, Identifiable{
    var id: UUID
    var name: String
    var image : String
    var price: Double
    var quality: Int
    init(id: UUID, name: String, image: String, price: Double, quality: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
        self.quality = quality
    }
}
struct MockProductCartModel {
    static var products = [ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10),
                           ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10),
                           ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10),
                           ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10),
                           ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10),
                           ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10),
                           ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10),
                           ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10),
                           ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10),
                           ProductCartModel(id: UUID(), name: "hamburger", image: "hamburger",  price: 1000,quality: 10)]
  
}
