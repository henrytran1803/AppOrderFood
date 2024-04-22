//
//  PaymentView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 03/04/2024.
//

import SwiftUI
import Firebase
struct PaymentView: View {
    @Binding var selectedRadioButton: String
    @Binding var  isCheckout: checkout
    @State var isAccept = false
    @Binding var order : Oder
    @ObservedObject var orderMV :OrderMV
    var body: some View {
        VStack{
            PaymentWithCash(isAccept : $isAccept, order: order)
            Button(action: {loadOrder()
                isCheckout  = .success
            
            }, label: {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color("bgproduct"))
                    .frame(width: .infinity, height: 60)
                    .overlay{
                        HStack{
                            Text("NEXT")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Image(systemName: "arrowtriangle.right.fill")
                                .foregroundColor(Color("bgbutton"))
                                .font(.system(size: 20))
                        }
                    }
            }).disabled(!isAccept)
            .padding([.leading, .trailing])
                .padding(.bottom, 70)
        }
        .onAppear{
            print(order)
        }
        
    }
    func loadOrder(){
        let docu : String  = UserDefaults.standard.string(forKey: "order") ?? "none"
        orderMV.getOrder(document: docu) { order in
            if let order = order {
                self.order = order
                print(order)
            } else {
                print("eo co")
            }
        }
    }
}

//#Preview {
//    PaymentView(selectedRadioButton: .constant("apple"), isCheckout: .constant(.payment), order: Oder(name: "", adress: "", total: 100, discount: 10, date: Timestamp(date: Date()) , products: [], status: .done, payment: .applePay) )
//}
