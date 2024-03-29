//
//  ListDiscount.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import SwiftUI

struct ListDiscount: View {
    @State var discounts :[DiscountModel]
    var body: some View {
        ScrollView{
            ForEach(discounts){ discount in
                DiscountView(discount: discount)
                
            }
        }.background(Color("bgproduct"))
    }
}

#Preview {
    ListDiscount(discounts: MockDiscount.discounts)
}
