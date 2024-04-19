//
//  DetailProductView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI

struct DetailProductView: View {
    @State var product: Product
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
                                    .padding(.top, 50)
                            })
                            Spacer()
                        }
                        AsyncImageCustom(url: product.image, framew: 360, corner: 20)
                            Spacer()
                            BottomProduct(product: product)
                                .padding(.bottom,20)
                    }
                }
            
            
        }.ignoresSafeArea()
        
    }
}

#Preview {
    DetailProductView(product: Product(name: "", detail: "", price: 10, quality: 10, star: 10, image: ""), isClick: .constant(true))
}
