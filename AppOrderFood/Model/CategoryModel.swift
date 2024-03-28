//
//  CategoryModel.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import Foundation

struct CategoryModel : Identifiable {
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
    static var category = CategoryModel(id: UUID(), name: "Hamburger", image: "hamburger")
}
