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
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(Color("bgproduct") )
                .frame(width:isClick ? .infinity :  170, height:isClick ? .infinity: 250)
                .animation(isClick ? .easeIn : .easeOut, value: isClick)
                .overlay{
          
                        VStack{
                            if isClick{
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
                            }
                            Image(product.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: isClick ? .infinity : 170)
                                .animation(isClick ? .easeIn : .easeOut, value: isClick)
                            if isClick{
                                Spacer()
                            }
                            if !isClick{
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
                            }else {
//                                RoundedRectangle(cornerRadius: 30)
//                                    .foregroundColor(Color(.white) )
//                                    .frame(width: .infinity , height:isClick ? 400 : 0)
//                                    .animation(isClick ? .easeIn : .easeOut, value: isClick)
                                BottomProduct(product: product)
                                    .opacity(isClick ? 0.95 :0)
                                        .scaleEffect(isClick ? 1 : 0.8)
                                        .animation(.smooth, value: isClick)
                            }
                        }
                    
                }
            

                .onTapGesture {
                    isClick = true
                }
            if isClick {
                
            }
            
            
            //                .foregroundStyle(.white)
            //                .frame(maxWidth: .infinity, maxHeight: show ? .infinity : 400)
            //                .padding(.horizontal, show ? 0 : 10)
            //                .padding(.bottom, show ? 0 : 10)
            //                .animation(show ? .easeIn : .easeOut, value: show)
        }.ignoresSafeArea()
    }
}


#Preview {
    Product()
}
