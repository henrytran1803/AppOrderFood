//
//  ListDiscount.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import SwiftUI

struct ListDiscount: View {
    @ObservedObject var viewModel = DiscountMV()
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.discounts, id: \.name) { discount in
                DiscountView(discount: discount)
            }
        }
        .background(Color("bgproduct"))
        .onAppear {
            viewModel.fetchDiscount{discount in
                viewModel.discounts = discount
            }
        }
    }
}

#Preview {
    ListDiscount()
}
