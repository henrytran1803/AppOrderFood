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
                        AsyncImageCustom(url: product.image, framew: 170, corner: 25)
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
struct AsyncImageCustom : View {
    @State var url : String
    @State var framew : CGFloat
    @State var corner : CGFloat
    var body: some View {
        AsyncImage(url: URL(string: url)) { phase in
            switch phase {
            case .empty: ZStack { Color.gray; ProgressView() }
            case .success(let image): image.resizable()
            case .failure(let error):
                Text(error.localizedDescription)
            }
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: framew)
        .cornerRadius(corner)
    }
}
