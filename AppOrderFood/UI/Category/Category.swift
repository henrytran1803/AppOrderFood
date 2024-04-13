//
//  Category.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI

struct Category: View {
    var category : CategoriesDetail
    @State var isClick = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 150, height: 45)
            .foregroundColor(isClick ? Color("bgcategoryclick") : Color("bgcategory"))
            .overlay {
                HStack {
                    // Sử dụng AsyncImage để tải và hiển thị ảnh từ URL
                    AsyncImage(url: URL(string: category.category.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView() // Placeholder trong lúc tải ảnh
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40)
                    
                    Text(category.name)
                        .foregroundColor(isClick ? .white : .secondary)
                }
            }
            .onTapGesture {
                isClick.toggle()
            }
    }
}

#Preview {
    Category(category: CategoriesDetail(name: "Test", category: Categories(detail: "", image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4xE7L7-lw86vVUN3eLdg-QNy58KPHocRO6GBUPBRtDg&s")))
}
 
