//
//  DetailProductModel.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import Foundation
struct DetailProductModel :Observable{
    var id: UUID
    var name: String
    var category : String
    var image : String
    var star : Double
    var price: Double
    var quality: Int
    var detail : String
    init(id: UUID, name: String, category: String, image: String, star: Double, price: Double, quality: Int, detail: String) {
        self.id = id
        self.name = name
        self.category = category
        self.image = image
        self.star = star
        self.price = price
        self.quality = quality
        self.detail = detail
    }
}


struct MockDetailProduct {
    static let product = DetailProductModel(id: UUID(), name: "Hamburger sieu to", category: "hamburger", image: "hamburger",star: 3.5, price: 100, quality: 20, detail: "Đây là hamburger có nhiều vị khác nhau vị matcha vị socola có nhiều size từ bé đến lớn ssssssssssssssssssssssssssssssssssssssssssssssssssssssss")
}