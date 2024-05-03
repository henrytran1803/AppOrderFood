//
//  CategoryManagerView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 25/04/2024.
//

import SwiftUI

struct CategoryManagerView: View {
    @State private var categories: [CategoriesDetail] = []
    var body: some View {
        VStack{
            Text("Quản lý danh mục")
                .bold()
                .font(.title)
            Spacer()
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    ForEach($categories, id: \.name) { category in
                        CateItem(name: category.name, category: category.category)
                    }
                }
                .padding(.horizontal)
            }
            HStack{
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.green)
                    .font(.system(size: 40))
            }.padding(.bottom, 80)
                .padding(.trailing)
            Spacer()
            .onAppear {
                CategoriesMV().fetchCategoriesDetails { categoriesDetails in
                    self.categories = categoriesDetails
                }
            }
        }
    }
}

#Preview {
    CategoryManagerView()
}

