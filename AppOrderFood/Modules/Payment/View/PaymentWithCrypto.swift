//
//  PaymentWithCrypto.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 04/04/2024.
//

import SwiftUI
import Firebase
import SocketIO

struct PaymentWithCrypto: View {
    @State var isOpen = false
    @Binding var order: Oder
    @State var request : ResponseData = ResponseData(data: DataItem(hosted_url: "", id: "", name: "", pricing_type: "", pricing: Pricing(), timeline: []), warnings: [])
    var body: some View {
        VStack{
            if !isOpen{
                Image("logocoinbase")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 70)
                Image("coinbase")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
                Spacer()
                if let hostedURL = URL(string: request.data.hosted_url ?? "") {
                    Link(destination: hostedURL) {
                        Rectangle()
                            .frame(width: 300, height: 70)
                            .cornerRadius(30)
                            .overlay{
                                HStack{
                                    Text("Open Link")
                                        .foregroundStyle(.white)
                                        .bold()
                                    Image(systemName: "link.circle.fill")
                                        .font(.system(size: 50))
                                        .foregroundStyle(.white)
                                }
                            }
                    }
                    
                } else {
                    Text("Invalid URL")
                        .foregroundColor(.red)
                }
                Button(action: {isOpen = true}, label: {
                    Text("Done")
                })
            }else {
                Socket(chargeID: request.data.id)
            }
            
        }
        .onAppear{
            Pay()
        }
    }
 
    func Pay(){
        let payment = NewPayment(name: order.name, description: order.adress, local_price: NewPayment.LocalPrice(amount: String((order.total*order.discount)/100)))
        PaymentMV(apiKey: "3a111c81-1900-41a8-98b4-9fa959fa2055").createCharge(data: payment) { result in
            switch result {
            case .success(let responseData):
                self.request = responseData
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

#Preview {
    PaymentWithCrypto(order:.constant( Oder(name: "", adress: "", total: 100, discount: 10, date: Timestamp(date: Date()) , products: [], status: .done, payment: .applePay) ))
}
