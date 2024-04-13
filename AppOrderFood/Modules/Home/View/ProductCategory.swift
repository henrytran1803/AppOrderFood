//
//  ProductCategory.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 13/04/2024.
//

import SwiftUI

struct ProductCategory: View {
    @State var name: String
    @Binding var isShow: Bool
    var body: some View {
        VStack{
            HStack{
                Button(action: {isShow = false}, label: {
                    Image(systemName: "arrow.left")
                        .bold()
                        .font(.system(size: 30))
                })
               Spacer()
                Text(name)
                    .bold()
                    .font(.system(size: 30))
                Spacer()
            }
            Divider()
            ListProductCategory(name:name)
        }
    }
}

#Preview {
    ProductCategory(name: "", isShow: .constant(true))
}
