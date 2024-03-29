//
//  DiscountModel.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import Foundation


struct DiscountModel: Identifiable {
    var id : UUID
    var name : String
    var image : String
    var percent : Double
    var duedate : Date
    var code : String
    
    init(id: UUID, name: String, image: String, percent: Double, duedate: Date, code: String) {
        self.id = id
        self.name = name
        self.image = image
        self.percent = percent
        self.duedate = duedate
        self.code = code
    }
}

struct MockDiscount {
    static var discounts = [ DiscountModel(id: UUID(), name: "Giảm giá mùa hè",image: "imgSalad", percent: 99.5, duedate: .now, code: "asdfgfwefgwefsedf")
    , DiscountModel(id: UUID(), name: "Giảm giá mùa hè",image: "imgSalad", percent: 99.5, duedate: .now, code: "asdfgfwefgwefsedf"),
                             DiscountModel(id: UUID(), name: "Giảm giá mùa hè",image: "imgSalad", percent: 99.5, duedate: .now, code: "asdfgfwefgwefsedf"),
                             DiscountModel(id: UUID(), name: "Giảm giá mùa hè",image: "imgSalad", percent: 99.5, duedate: .now, code: "asdfgfwefgwefsedf"),
                             DiscountModel(id: UUID(), name: "Giảm giá mùa hè",image: "imgSalad", percent: 99.5, duedate: .now, code: "asdfgfwefgwefsedf"),
    
    
    ]
    
}
