//
//  DetailProductModel.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import Foundation
struct DetailProductModel : Hashable{
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
    static let products = [DetailProductModel(id: UUID(), name: "Hamburger", category: "FastFood", image: "hamburger",star: 4.5, price: 100, quality: 20, detail: "Hamburger đến từ hành tinh lạ với nhiều hương vị độc đáo có nhiều phô mai và không có thịt nhé bánh xịn ghê hông"), DetailProductModel(id: UUID(), name: "Bún cá viên chiên", category: "HeathyFood", image: "imgNoodle",star: 3.5, price: 100, quality: 20, detail: "Bún cá viên chiên với nhiều vị độc đáo có kèm rau giúp bạn cảm thấy healthy hơn nè"), DetailProductModel(id: UUID(), name: "Cơm trứng", category: "HeathyFood", image: "imgRice",star: 3.5, price: 100, quality: 20, detail: "Cơm với raát nhiều rau và trứng phù hợp với nhân tập gym"), DetailProductModel(id: UUID(), name: "Salad với xoài", category: "Salad", image: "imgSalad",star: 4.5, price: 100, quality: 20, detail: "Quá ngán ăn món chính hãy ăn salad nó giúp bạn thấy tươi mới hơn đó"), DetailProductModel(id: UUID(), name: "Salad với cá", category: "Salad", image: "imgSalad",star: 4.5, price: 100, quality: 20, detail: "Quá ngán ăn món chính hãy ăn salad nó giúp bạn thấy tươi mới hơn đó"), DetailProductModel(id: UUID(), name: "Taco", category: "FastFood", image: "imgTaco" ,star: 4.5, price: 100, quality: 20, detail: "Taco đến từ hành tinh lạ với nhiều hương vị độc đáo có nhiều phô mai và không có thịt nhé bánh xịn ghê hông"), DetailProductModel(id: UUID(), name: "Rau sống", category: "Vegtable", image: "imgVegtable",star: 4.5, price: 100, quality: 20, detail: "Chỉ có mỗi rau sôngs ăn kèm với mọi thứ")]
}
