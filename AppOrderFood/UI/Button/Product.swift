//
//  Product.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 06/03/2024.
//

import SwiftUI

struct Product: View {
    @State var products: [ProductModel] = [MockProduct.product1, MockProduct.product1, MockProduct.product1,MockProduct.product2, MockProduct.product3, MockProduct.product2]
    @State var isClick = false
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) { // Adjust spacing as needed
                ForEach(products) { product in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        ProductButton(product: product)
                    }).buttonStyle(ButtonProduct())
                }
            }
            .padding(.horizontal, 20)
            .padding()
        }
    }
}

struct ProductButton: View {
    let product: ProductModel
    var body: some View {
        VStack {
            Image(product.image)
    
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Capsule())
                .frame(width: 100.0, height: 100)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            Text(product.name)
                .font(.system(size: 20).bold())
            Text(product.category)
                .foregroundStyle(.secondary)
                .font(.system(size: 15))
            Text("Price: \(product.price) VND")
                .multilineTextAlignment(.leading)
                    .foregroundStyle(.red)
                    .padding()
            
        }
        .shadow(radius: 3)
        .border(Color.black.opacity(0.2))
    }
}
struct ButtonProduct : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .shadow(radius: 3)
            .border(Color.black.opacity(0.2))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .background(configuration.isPressed ? Color.pink : Color.white)
    }
}
#Preview {
    Product()
}
