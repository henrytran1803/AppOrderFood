//
//  Product.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 06/03/2024.
//

import SwiftUI

struct Product: View {
    @State var product  = MockDetailProduct.products[1]
    @State var isClick = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("bgproduct") )
                .frame(width:  170, height: 250)
                .overlay{
                    VStack{
                        Image(product.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width:  170)
                        VStack(alignment: .leading){
                            Text(product.name)
                            .foregroundColor(.white)
                            Text(product.category)
                                .foregroundColor(.white)
                                .padding(.leading)
                        }
                        HStack{
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            Text("\(String(format: "%.1f", product.star))")
                                .foregroundColor(.white)
                            Spacer()
                            Text("\(String(format: "%.2f",product.price))")
                                .foregroundColor(.white)
                        }.padding([.leading, .bottom, .trailing])
                    }
                    }
                }
    }
}


#Preview {
    Product()
}
