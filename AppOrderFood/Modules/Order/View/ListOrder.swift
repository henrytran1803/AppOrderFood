//
//  ListOrder.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//

import SwiftUI

struct ListOrder: View {
    @Binding var orders: [Oder] // Sửa từ Oder thành Order
    var body: some View {
        List{
            ForEach($orders, id: \.self){ order in
                OrderRow(order: order)
            }
        }
    }
}

// Đảm bảo rằng bạn tạo dữ liệu cho biến orders trong phần Preview

//#Preview {
//    static var previews: some View {
//        ListOrder(orders: .constant([Order(name: "Order 1"), Order(name: "Order 2")])) // Tạo dữ liệu mẫu cho orders
//    }
//}
