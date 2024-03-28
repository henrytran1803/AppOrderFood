//
//  ListCategory.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI

struct ListCategory: View {
    @State var categorys : [CategoryModel] = [MockCategoryModel.category, MockCategoryModel.category , MockCategoryModel.category]
//    @State var selected = self.categorys[0]
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(categorys) { category in
                    Category(category: category)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ListCategory()
}
