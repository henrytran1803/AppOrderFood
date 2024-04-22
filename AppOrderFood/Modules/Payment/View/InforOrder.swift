//
//  InforOrder.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//

import SwiftUI
import Firebase
struct InforOrder: View {
    @Binding var order: Oder
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .frame(width: .infinity, height: 300)
            .foregroundColor(.secondary)
            .overlay{
                List{
                    Section(header: Text("Infomation Order")) {
                        HStack(alignment: .top, spacing: 0){
                            Text("Name: ")
                                .bold()
                            Text("\(order.name)")
                        }
                        HStack(alignment: .top, spacing: 0){
                            Text("Address: ")
                                .bold()
                            Text("\(order.adress)")
                        }
                        HStack(alignment: .top, spacing: 0){
                            Text("total: ")
                                .bold()
                            Text("\(order.total)")
                        }
                        HStack(alignment: .top, spacing: 0){
                            Text("Status: ")
                                .bold()
                            Text("\(order.status)")
                        }
                        HStack(alignment: .top, spacing: 0){
                            Text("Payment: ")
                                .bold()
                            Text("\(order.payment)")
                        }                        
                    }.foregroundColor(.secondary)
                }
            }
    }
}

#Preview {
    InforOrder(order: .constant( Oder(name: "name", adress: "nbalna", total: 100, discount: 10, date: Timestamp(date: Date()), products: [], status: .done, payment: .applePay)))
}
