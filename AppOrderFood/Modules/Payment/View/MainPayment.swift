//
//  MainPayment.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 02/04/2024.
//

import SwiftUI
enum checkout{
    case checkout, payment, success
}
struct MainPayment: View {
    @State var  order :Oder
    @State var isCheckout: checkout = .checkout
    @State var selectedRadioButton = "Cash"
    @StateObject var orderMV: OrderMV = OrderMV()

    var body: some View {
        Spacer()
            VStack{
                HStack{
                    Image(systemName: "circle.circle.fill")
                        .renderingMode(.original)
                        .foregroundColor(Color(.yellow))
                        .font(.system(size: 20))
                    Rectangle()
                        .frame(width:isCheckout == .checkout ?0: 50,height: 1)
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: isCheckout)
                    if (isCheckout == .checkout){
                        Spacer()
                    }
                    Image(systemName:isCheckout == .checkout ? "circle.fill": "circle.circle.fill")
                        .renderingMode(.original)
                        .foregroundColor(Color(isCheckout ==  .checkout ? .gray : .yellow)) //
                        .font(.system(size: 20))
                    Rectangle()
                        .frame(width:isCheckout == .success ? 50 : 0 ,height:  1)
                        .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: isCheckout)
                    if (isCheckout == .payment || isCheckout == .checkout){
                        Spacer()
                    }
                   
                    Image(systemName: isCheckout ==  .success ? "circle.circle.fill" : "circle.fill"  )
                        .renderingMode(.original) 
                        .foregroundColor(Color(isCheckout ==  .success ? .yellow : .gray)) // <2>
                        .font(.system(size: 20))
                    
                }.frame(width: 200,height: 30)
                    .padding()
                Divider()
//                HStack{
//                    Picker(selection: $isCheckout, label: Text("Checkout Status")) {
//                        Text("Checkout").tag(checkout.checkout)
//                        Text("Payment").tag(checkout.payment)
//                        Text("Success").tag(checkout.success)
//                    }
//                    .pickerStyle(SegmentedPickerStyle())
//                    .frame(width: 200)
//                }
                Spacer()
                if (isCheckout == .checkout){
                    ProductCheckout(isCheckout: $isCheckout, order: $order , selectedRadioButton: $selectedRadioButton, orderMV: orderMV)
                }else if (isCheckout == .payment){
                    PaymentView(selectedRadioButton: $selectedRadioButton, isCheckout: $isCheckout, order: $order,  orderMV: orderMV)
                } else {
                    CheckoutView(orderMV: orderMV, order: $order)
                }
            }
    }
//    func Checkout() -> some View{
//        if self.selectedRadioButton == "Cash" {
//            Cashpayment()
//        }else if self.selectedRadioButton == "Crypto" {
//            Cryptopayment()
//        } else{
//            ApplePayment()
//        }
//    }
//    
//    
//    func Cashpayment() -> some View{
//        return ApplePayment()
//    }
//    
//    func Cryptopayment() -> any View{
//        return ApplePayment()
//    }
//    
//    func ApplePayment() -> any View {
//        return ApplePayment()
//    }
    
}
