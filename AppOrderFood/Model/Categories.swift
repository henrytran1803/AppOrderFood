//
//  Categories.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 13/04/2024.
//

import Foundation
import FirebaseFirestore
import Firebase


struct Categories: Codable {
    var detail: String
    //var products: [Product]
    var image: String



    enum CodingKeys: String, CodingKey {
        case detail = "detail"
        case image = "image"
    }
  
}

struct Product: Codable {
    var name: String
    var detail: String
    var price: Double
    var quality: Int
    var star: Double
    var image: String
}

struct CategoriesDetail: Codable {
    var name : String
    var category: Categories
}
