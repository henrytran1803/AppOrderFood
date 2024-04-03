//
//  ListProductCheckout.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 03/04/2024.
//

import SwiftUI

struct ListProductCheckout: View {
    @State var products : [ProductCartModel]
    var body: some View {
        ScrollView{
            ForEach(products){ product in
                HStack{
                    Image("\(product.image)")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Spacer()
                    Text(product.name)
                        .bold()
                    Text("\(String(format: "%.1f", product.price * Double(product.quality) ))")
                    Text("\(product.quality)")
                }.frame(width: .infinity,height: 40)
                    .padding()
                
            }
        }
    }
}

#Preview {
    ListProductCheckout(products: MockProductCartModel.products)
}
