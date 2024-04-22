//
//  OrderView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//

import SwiftUI

struct OrderView: View {
    @ObservedObject var orderMV: OrderMV = OrderMV()
    @State var orders : [Oder] = []
    @State var isLoading = false
    var body: some View {
        NavigationView{
            if isLoading{
                ListOrder(orders: $orders)
            }else {
                ProgressView("Loading")
            }
        }
            .onAppear{
                loadOrder()
            }
    }
    func loadOrder(){
        orderMV.fetchAllOrder{orders in
            
            self.orders = orders
            print(orders)
            self.isLoading = true
        }
    }
}

#Preview {
    OrderView()
}
