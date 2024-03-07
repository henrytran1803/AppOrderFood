//
//  Category.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import Foundation

struct CategoryShow: Identifiable {
    let id : UUID
    let name : String
    let imageName : String
    init(id: UUID, name: String, imageName: String) {
        self.id = id
        self.name = name
        self.imageName = imageName
    }
    
}

struct MockCategory {
    static let  hamburger = CategoryShow(id: UUID(), name: "hamburger", imageName: "hamburger")
    static let pizza = CategoryShow(id: UUID(), name: "pizza", imageName: "pizza")
    static let drink = CategoryShow(id: UUID(), name: "drink", imageName: "drink")
    
}
