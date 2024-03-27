//
//  Product.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 06/03/2024.
//

import SwiftUI

struct Product: View {
    @State var product  = MockDetailProduct.product
    @State var isClick = false
    var body: some View {
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("bgproduct"))
                .frame(width: 170, height: 250)
                .overlay{
                    VStack{
                        Image(product.image)
                            .resizable()
                            .frame(width: 170, height: 130)
                        Text(product.name)
                            .foregroundColor(.white)
                        
                        HStack{
                            Text(product.category)
                                .foregroundColor(.white)
                                .padding(.leading)
                            Spacer()
                        }
                            HStack{
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                Text("\(String(format: "%.1f", product.star))")
                                    .foregroundColor(.white)
                                Spacer()
                                Text("\(String(format: "%.2f",product.price))")
                                    .foregroundColor(.white)
                            }.padding(.horizontal)
                    }
            }
                .onTapGesture {
                    isClick = true
                }
    }
}


#Preview {
    Product()
}
