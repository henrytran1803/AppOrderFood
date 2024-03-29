//
//  ListCartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import SwiftUI

struct ListCartView: View {
    @State var products : [ProductCartModel]
    var body: some View {
        ScrollView{
            ForEach(products){ product in
                ItemCartView(product: product)
                    .padding(.bottom)
                
            }
        }.background(Color("bgcart"))
    }
}

#Preview {
    ListCartView(products: MockProductCartModel.products)
}
