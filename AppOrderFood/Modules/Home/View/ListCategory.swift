//
//  ListCategory.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI

struct ListCategory: View {
    @State var categorys: [CategoryModel] = MockCategoryModel.categorys
    @Binding var selectedCategory: CategoryModel?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(categorys) { category in
                    Category(category: category)
                        .onTapGesture {
                            // Cập nhật loại được chọn khi người dùng nhấn vào nó
                            self.selectedCategory = category
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(category == selectedCategory ? .blue : .clear)
                        )
                }
            }
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    ListCategory(selectedCategory: MockCategoryModel.categorys[1])
//}
