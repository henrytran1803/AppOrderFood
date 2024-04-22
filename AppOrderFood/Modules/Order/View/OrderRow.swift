//
//  OrderRow.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//

import SwiftUI
import Firebase
struct OrderRow: View {
    @Binding var order: Oder
    @State var fullDetail  = false
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy 'at' HH:mm:ss"
        return formatter
    }
    var body: some View {
        VStack{
            HStack{
                Text(order.name)
                    .bold()
                    .foregroundStyle(.secondary)
                Spacer()
                if order.status == .done {
                    Text("Hoàn thành")
                        .foregroundStyle(.green)
                        .bold()
                        .font(.system(size: 13))
                }else if order.status == .pendding{
                    Text("Đang giao")
                        .foregroundColor(Color.orange)
                        .bold()
                        .font(.system(size: 13))
                }else {
                    Text("Không thành công")
                        .foregroundColor(Color.red)
                        .bold()
                        .font(.system(size: 13))
                }
            }
            HStack{
                Text(order.adress)
                Spacer()
                VStack{
                    Text("\(order.payment)")
                    Text("\(String(format: "%.2f", (order.total - (order.total*order.discount)/100)))")
                    Text("Date: \(formattedDate(from: order.date))")
                }
            }.font(.system(size: 10))
            
            Divider()
            Button(action: {fullDetail.toggle()}, label: {
                Text(fullDetail ? "Thu gọn sản phẩm" :  "Xem sản phẩm")
                    .font(.system(size: 10))
                    .foregroundStyle(.secondary)
            })
            Divider()
            if fullDetail {
                ListProductOrder(products : $order.products)
            }
            
            
        }
    }
    func formattedDate(from timestamp: Timestamp) -> String {
         let date = timestamp.dateValue()
         return dateFormatter.string(from: date)
     }
}
//
//#Preview {
//    OrderRow(order: Oder(name: "tra viet anh", adress: "bla bla", total: 100, discount: 10, date: Timestamp(date: Date()), products: [], status: .done, payment: .applePay))
//}
