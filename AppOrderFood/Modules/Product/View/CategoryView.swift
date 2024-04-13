//
//  CategoryView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 13/04/2024.
//

import SwiftUI

struct CategoryView: View {
    @State var isopenproduct = false
    @State var value : Categories = Categories(detail: "", image: "")
    @State var name: String = ""
    var body: some View {
        TextField("name", text:  $name)
        TextField("detail", text:  $value.detail)
        TextField("image", text:  $value.image)
        
        Button(action: {
            CategoriesMV().addCategory(value: value, name: name)
            
        }, label: {
            Text("Add")
        })
        Button(action: {
            isopenproduct = true
            
        }, label: {
            Text("openproduct")
        })
        .fullScreenCover(isPresented: $isopenproduct, content: {
            ProductAdd()
        })
    }
    
    
        
}

#Preview {
    CategoryView()
}
