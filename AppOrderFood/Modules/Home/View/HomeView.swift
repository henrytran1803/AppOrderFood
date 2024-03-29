//
//  HomeView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI

struct HomeView: View {
    @State var search = ""
    @State var selectedCategory: CategoryModel?
    var body: some View {
        
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("Xin chào, Việt anh")
                    Text("Chào mừng trở lại!")
                        .font(.title)
                }
                Spacer()
            }.padding(.horizontal)
            TextField("", text: $search)
                .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Tìm kiếm")
                        Spacer()
                    }.padding(.leading)
                        .padding(.horizontal, 16)
                        .foregroundColor(.gray)
                )
                ListCategory(selectedCategory: $selectedCategory)
                HStack{
                    Text("Favorite")
                        .font(.title2)
                        .bold()
                        .padding()
                    Spacer()
                    
                }
                ListProduct(products: MockDetailProduct.products)
            
            
        }.padding(.top, 60)
    }
//    var selectedProducts: [DetailProductModel] {
//        if let selectedCategory = selectedCategory {
//            return MockDetailProduct.products.filter { $0.category == selectedCategory }
//        } else {
//            return MockDetailProduct.products
//        }
//    }
}

#Preview {
    HomeView()
}
