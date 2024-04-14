//
//  ListCartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import SwiftUI

struct ListCartView: View {
    @ObservedObject var cart = CartMV()
    @State var products: [Product] = []
    @Binding var total: Double
    var body: some View {
        List {
            ForEach($products, id: \.name) { product in
                ItemCartView(cart: cart, product: product, total: $total)
                    .padding(.bottom)
            }
            .onDelete(perform: removeRows)
        }
        
        .background(Color("bgcart"))
        .onAppear {
            cart.fetchProductCart { products in
                self.products = products
                total = cart.total
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        var total2: Double = 0
        offsets.forEach { index in
            let productToDelete = products[index]
            cart.deleteProductCart(value: productToDelete) 
            total2 += Double(products[index].quality) * products[index].price
        }
        
        products.remove(atOffsets: offsets)
        total = cart.totalProduct() - total2
    }
}


#Preview {
    ListCartView(products: [], total: .constant(10))
}
