//
//  CheckoutView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 03/04/2024.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var orderMV: OrderMV
    @Binding var order : Oder
    var body: some View {
        if(order.payment == .cash){
            SuccessView(order: $order)
        }else{
            PaymentWithCrypto(order: $order)
        }
    }
}

//#Preview {
//    CheckoutView()
//}
