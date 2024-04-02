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
    @State var isCheckout: checkout = .payment
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "circle.circle.fill")
                    .renderingMode(.original) // <1>
                    .foregroundColor(Color(.yellow)) // <2>
                    .font(.system(size: 20))
                Rectangle()
                    .frame(width:isCheckout == .checkout ?0: 50,height: 1)
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: isCheckout)
                if (isCheckout == .checkout){
                    Spacer()
                }
                Image(systemName:isCheckout == .checkout ? "circle.fill": "circle.circle.fill")
                    .renderingMode(.original) // <1>
                    .foregroundColor(Color(isCheckout ==  .checkout ? .gray : .yellow)) //
                    .font(.system(size: 20))
                Rectangle()
                    .frame(width:isCheckout == .success ? 50 : 0 ,height:  1)
                    .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/, value: isCheckout)
                if (isCheckout == .payment || isCheckout == .checkout){
                    Spacer()
                }
               
                Image(systemName: isCheckout ==  .success ? "circle.circle.fill" : "circle.fill"  )
                    .renderingMode(.original) // <1>
                    .foregroundColor(Color(isCheckout ==  .success ? .yellow : .gray)) // <2>
                    .font(.system(size: 20))
                
            }.frame(width: 200,height: 30)
            
            
            HStack{
                Picker(selection: $isCheckout, label: Text("Checkout Status")) {
                    Text("Checkout").tag(checkout.checkout)
                    Text("Payment").tag(checkout.payment)
                    Text("Success").tag(checkout.success)
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 200)
            }
        }
    }
}

#Preview {
    MainPayment()
}