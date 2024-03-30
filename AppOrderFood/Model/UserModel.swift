//
//  UserModel.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 30/03/2024.
//

import Foundation
struct UserModel {
    var id: UUID
    var lastname: String
    var fistname: String
    var  image: String
    var email:String
    var dateofbirth: Date
    var address: String
    init(id: UUID, lastname: String, fistname: String, image: String, email: String, dateofbirth: Date, address: String) {
        self.id = id
        self.lastname = lastname
        self.fistname = fistname
        self.image = image
        self.email = email
        self.dateofbirth = dateofbirth
        self.address = address
    }
    
}

struct MockUser {
    static var user = UserModel(id: UUID(), lastname: "Trần", fistname: "Việt Anh", image: "imgFace", email: "tranvietanh1803@gmail.com", dateofbirth: .now, address: "147 trần hưng đạo- tt phước an -krông pắc- đắk lắk")
}
