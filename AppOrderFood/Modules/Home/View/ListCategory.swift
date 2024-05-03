//
//  ListCategory.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI

struct ListCategory: View {
    @State private var categories: [CategoriesDetail] = []
    @Binding var selectedCategory: CategoriesDetail?
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(categories, id: \.name) { category in
                    Category(category: category)
                        .onTapGesture {
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
        .onAppear {
            CategoriesMV().fetchCategoriesDetails { categoriesDetails in
                self.categories = categoriesDetails
            }
        }
    }
}
extension CategoriesDetail: Equatable {
    static func == (lhs: CategoriesDetail, rhs: CategoriesDetail) -> Bool {
        return lhs.name == rhs.name // Hoặc bất kỳ logic so sánh nào phù hợp với cấu trúc của bạn
    }
}

//#Preview {
//    ListCategory(selectedCategory: MockCategoryModel.categorys[1])
//}
