//
//  ListProduct.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//
import SwiftUI
struct ListProduct: View {
    @State var products: [Product] = []
    @State private var selectedProduct: Product?
    @State private var isPresentingDetail = false
    @Binding var searchText : String
    var columns: [GridItem] = [
        GridItem(.fixed(190)),
        GridItem(.fixed(190))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(filteredProduct, id: \.name) { product in
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
            ProductMV().fetchProductsFromAllCategories { products in
                self.products = products
            }
        }
    }
    var filteredProduct: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ListProduct_Previews: PreviewProvider {
    static var previews: some View {
        ListProduct(searchText: .constant(""))
    }
}
