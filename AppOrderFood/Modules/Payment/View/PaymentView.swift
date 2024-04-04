//
//  PaymentView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 03/04/2024.
//

import SwiftUI

struct PaymentView: View {
    @Binding var selectedRadioButton: String
    var body: some View {
        VStack{
            if (selectedRadioButton == "ApplePay"){
                PaymentWithApplePay()
            }else if (selectedRadioButton == "Crypto"){
                PaymentWithCrypto()
            }else {
                PaymentWithCash()
            }
        }
    }
}

#Preview {
    PaymentView(selectedRadioButton: .constant("apple"))
}
