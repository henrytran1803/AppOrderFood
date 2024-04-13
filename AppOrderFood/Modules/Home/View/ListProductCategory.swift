//
//  ListProductCategory.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 13/04/2024.
//

import SwiftUI

struct ListProductCategory: View {
    @State var name : String
    @State var products: [Product] = []
    @State private var selectedProduct: Product?
    @State private var isPresentingDetail = false
    
    var columns: [GridItem] = [
        GridItem(.fixed(190)),
        GridItem(.fixed(190))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(products, id: \.name) { product in
                        ProductView(product: product)
                            .frame(width: geometry.size.width / 0)
                            .onTapGesture {
                                self.selectedProduct = product
                                self.isPresentingDetail = true
                            }
                    }
                }
            }
        }
        
        .fullScreenCover(isPresented: $isPresentingDetail, content: {
            DetailProductView(product: selectedProduct ?? Product(name: "", detail: "", price: 10, quality: 10, star: 10, image: ""), isClick: $isPresentingDetail)
                .onDisappear {
                    self.selectedProduct = nil
                }
        })

        .onAppear {
            ProductMV().fetchProductByCategory(category: name) { products in
                self.products = products
            }
        }
    }
}

#Preview {
    ListProductCategory(name : "")
}
