//
//  ListProductOrder.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//

import SwiftUI

struct ListProductOrder: View {
    @Binding var products: [Product]
    
    var body: some View {
        List {
            ForEach(products, id: \.self) { product in
                Text("\(product.name)")
            }
        }
    }
}


//#Preview {
//    ListProductOrder()
//}
