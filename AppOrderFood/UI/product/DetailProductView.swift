//
//  DetailProductView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI

struct DetailProductView: View {
    @State var product: DetailProductModel
    @Binding var isClick :Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("bgproduct") )
                .frame(width:.infinity , height:.infinity)
                .overlay{
                    VStack{
                        HStack{
                            Button(action: {isClick.toggle()}, label: {
                                Image(systemName: "arrow.backward")
                                    .foregroundColor(.white)
                                    .font(.system(size: 30))
                                    .padding()
                                    .padding(.top, 30)
                            })
                            
                            Spacer()
                        }
                        Image(product.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: .infinity )
                            Spacer()
                            BottomProduct(product: product)
                                .padding(.bottom,20)
                    }
                }
            
            
        }.ignoresSafeArea()
        
    }
}

#Preview {
    DetailProductView(product: MockDetailProduct.products[1],isClick: .constant(false))
}
