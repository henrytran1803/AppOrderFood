//
//  ProductAdd.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 13/04/2024.
//

import SwiftUI
struct ProductAdd: View {
    @State var category: [String] = []
    @State var selectedCategoryIndex = 0
    @State var product: Product = Product(name: "", detail: "", price: 0, quality: 0, star: 0, image: "")
    @State var name  = ""
    @State private var priceText = ""
    @State private var qualityText = ""
    @State private var starText = ""
    
    var body: some View {
        VStack {
            Picker("Select Category", selection: $selectedCategoryIndex) {
                ForEach(0..<category.count, id: \.self) { index in
                    Text(category[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            TextField("name", text: $product.name)
            TextField("detail", text: $product.detail)
            TextField("price", text: $priceText)
                .onChange(of: priceText) { newValue in
                    if let price = Double(newValue) {
                        product.price = price
                    }
                }
            TextField("image", text: $product.image)
            TextField("quality", text: $qualityText)
                .onChange(of: qualityText) { newValue in
                    if let quality = Int(newValue) {
                        product.quality = quality
                    }
                }
            TextField("star", text: $starText)
                .onChange(of: starText) { newValue in
                    if let star = Double(newValue) {
                        product.star = star
                    }
                }
            Button(action: {
                if !category.isEmpty {
                    ProductMV().addProduct(value: product, category: category[selectedCategoryIndex])
                } else {
                    print("No category loaded yet.")
                }
            }, label: {
                Text("add")
            })
        }
        .onAppear {
            CategoriesMV().fetchDocumentNames { documentNames in
                print(documentNames)
                self.category = documentNames
            }
        }
    }
}

#Preview {
    ProductAdd()
}
