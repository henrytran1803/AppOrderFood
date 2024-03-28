//
//  ListProduct.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//
import SwiftUI

struct ListProduct: View {
    var products: [DetailProductModel]
    @State private var selectedProduct: DetailProductModel?
    @State private var isPresentingDetail = false
    
    var columns: [GridItem] = [
        GridItem(.fixed(190)),
        GridItem(.fixed(190))
    ]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(products, id: \.self) { product in
                        Product(product: product)
                            .frame(width: geometry.size.width / 0)
                            .onTapGesture {
                                // Lưu sản phẩm được chọn vào biến selectedProduct
                                self.selectedProduct = product
                                // Kích hoạt hiển thị màn hình chi tiết
                                self.isPresentingDetail = true
                            }
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $isPresentingDetail, content: {
            // Truyền sản phẩm được chọn vào màn hình chi tiết
            DetailProductView(product: selectedProduct ?? MockDetailProduct.products[1], isClick: $isPresentingDetail)
        })
    }
}

struct ListProduct_Previews: PreviewProvider {
    static var previews: some View {
        ListProduct(products: MockDetailProduct.products)
    }
}
