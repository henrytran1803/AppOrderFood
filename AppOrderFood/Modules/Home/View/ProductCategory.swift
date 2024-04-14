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
            HStack {
                Button(action: { isShow = false }) {
                    Image(systemName: "arrow.left")
                        .bold()
                        .font(.system(size: 30))
                }

                Spacer()
                Text(name)
                    .bold()
                    .font(.system(size: 30))
                    .foregroundStyle(.secondary)

                Spacer()
                Button(action: {}) {
                    
                }
                .disabled(true)
            }
            Divider()
            ListProductCategory(name:name)
        }
    }
}

#Preview {
    ProductCategory(name: "", isShow: .constant(true))
}
