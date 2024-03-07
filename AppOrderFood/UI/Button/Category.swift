//
//  Category.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 06/03/2024.
//

import SwiftUI

struct Category: View {
    @State var categorys: [CategoryShow] = [MockCategory.hamburger, MockCategory.drink, MockCategory.pizza]
    @State var isClick = false
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) { // Adjust spacing as needed
                ForEach(categorys) { category in
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        CategoryButton(category: category)
                    }).buttonStyle(ButtonCategory())                    
                }
            }
            .padding(.horizontal, 20)
            .padding()
        }
    }
}

struct CategoryButton: View {
    let category: CategoryShow
    var body: some View {
        VStack {
            Image(category.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Capsule())
                .frame(width: 75, height: 50)
                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            Text(category.name)
                .foregroundColor(.secondary)
                .font(.system(size: 15))
                .padding()
        }
        .shadow(radius: 3)
        .border(Color.black.opacity(0.2))
    }
}
struct ButtonCategory : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .shadow(radius: 3)
            .border(Color.black.opacity(0.2))
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .background(configuration.isPressed ? Color.green : Color.white)
    }
}
#Preview {
    Category()
}
