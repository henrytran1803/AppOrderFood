//
//  Payment.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//

import Foundation

struct NewPayment: Codable {
    var name: String
    var description: String
    var pricing_type: String = "fixed_price"
    var local_price: LocalPrice
    
    enum CodingKeys: String, CodingKey {
        case  name, description, pricing_type, local_price
    }
    
    struct LocalPrice: Codable {
        var amount: String
        var currency: String = "VND"
    }
}

struct ResponseData: Codable {
    var data: DataItem
    var warnings: [String]
}

struct DataItem: Codable {
    var hosted_url: String
    var id: String
    var name: String
    var pricing_type: String
    var pricing: Pricing
    var timeline: [TimelineItem]
}

struct Pricing: Codable {
    var local: Price?
    var settlement: Price?
}

struct Price: Codable {
    var amount: String?
    var currency: String?
}

struct TimelineItem: Codable {
    var status: String
    var time: String
}

