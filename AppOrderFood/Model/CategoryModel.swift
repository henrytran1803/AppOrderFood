//
//  CategoryModel.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import Foundation

struct CategoryModel : Identifiable, Equatable  {
    var id: UUID
    var name : String
    var image : String
    init(id: UUID, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}

struct MockCategoryModel {
    static var categorys = [CategoryModel(id: UUID(), name: "FastFood", image: "hamburger"),
                            CategoryModel(id: UUID(), name: "Salad", image: "imgSalad"),
                            CategoryModel(id: UUID(), name: "Vegtable", image: "imgVegtable"),
                            CategoryModel(id: UUID(), name: "HeathyFood", image: "imgNoodle"),
    ]
}
