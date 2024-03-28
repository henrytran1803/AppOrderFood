//
//  Category.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI

struct Category: View {
    @State var category : CategoryModel
    @State var isclick = false
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 150,height: 45)
            .foregroundColor(isclick ? Color("bgcategoryclick") : Color("bgcategory"))
            .overlay{
                HStack{
                    Image("\(category.image)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                    Text(category.name)
                        .foregroundColor(isclick ? .white : .secondary)
                }
            }
            .onTapGesture {
                isclick.toggle()
            }
    }
}

#Preview {
    Category(category: MockCategoryModel.category)
}
