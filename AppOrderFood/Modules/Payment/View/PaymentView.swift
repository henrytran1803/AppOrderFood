//
//  PaymentView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 03/04/2024.
//

import SwiftUI

struct PaymentView: View {
    @Binding var selectedRadioButton: String
    @Binding var  isCheckout: checkout
    @State var isAccept = false
    var body: some View {
        VStack{
            if (selectedRadioButton == "ApplePay"){
                PaymentWithApplePay()
            }else if (selectedRadioButton == "Crypto"){
                PaymentWithCrypto()
            }else {
                PaymentWithCash(isAccept : $isAccept)
            }
            Button(action: {isCheckout  = .success}, label: {
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
    }
}

#Preview {
    PaymentView(selectedRadioButton: .constant("apple"), isCheckout: .constant(.payment))
}
