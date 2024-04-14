//
//  ProductView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 06/03/2024.
//

import SwiftUI

struct ProductView: View {
    @State var product: Product
    @State var isClick = false
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("bgproduct") )
                .frame(width:  170, height: 250)
                .overlay{
                    VStack{
                        AsyncImage(url: URL(string: product.image)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 170)
                        .cornerRadius(25)
                        Spacer()
                        VStack(alignment: .leading){
                            Text(product.name)
                            .foregroundColor(.white)
                            .bold()
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
    ProductView(product: Product(name: "", detail: "", price: 100, quality: 10, star: 10, image: ""))
}
