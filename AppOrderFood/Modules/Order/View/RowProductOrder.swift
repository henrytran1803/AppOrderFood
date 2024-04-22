//
//  RowProductOrder.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//

import SwiftUI

struct RowProductOrder: View {
    @State var product: Product
    var body: some View {
        HStack{
            Spacer()
            AsyncImageCustom(url: product.image, framew: 50, corner: 10)
            Text(product.name)
                .bold()
            Spacer()
            VStack{
                Text("\(String(format: "%.2f", product.price))")
                Text("\(product.quality)")
            }
            Spacer()
        }
    }
}

#Preview {
    RowProductOrder(product: Product(name: "hambur", detail: "kjhkjh", price: 10, quality: 10, star: 4.5, image: ""))
}
