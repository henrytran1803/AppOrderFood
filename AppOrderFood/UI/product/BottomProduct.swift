//
//  BottomProduct.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI

struct BottomProduct: View {
    @State var product : Product
    @State var isClick = true
    @State private var count = 1
    @State private var totalPrice: Double = 0
    @State private var isAdd = false
    var body: some View {
        VStack{
            if isClick {
                Spacer()
            }
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(Color(.white) )
                    .frame(width: .infinity , height:isClick ? 400 : 0)
                    .animation(isClick ? .easeIn(duration: 1) : .easeOut(duration: 1), value: isClick)
                    .overlay{
                        VStack{
                            HStack{
                                    RoundedRectangle(cornerRadius: 30)
                                        .foregroundColor(Color("bgproduct") )
                                        .frame(width: 80 , height:50)
                                        .overlay{
                                            HStack{
                                                Image(systemName: "star.fill")
                                                    .foregroundColor(.yellow)
                                                Text("\(String(format: "%.1f", product.star))")
                                                    .foregroundColor(.white)
                                            }
                                        }
                                Spacer()
                                HStack{
                                    Button(action: {decreaseCount()}, label: {
                                        Image(systemName: "minus.square.fill")
                                            .font(.system(size: 30))
                                            .foregroundColor(.green)
    
                                    })
                                    Text("\(count)")
                                    Button(action: {count += 1}, label: {
                                        Image(systemName: "plus.square.fill")
                                            .font(.system(size: 30))
                                            .foregroundColor(.green)
                                    })
                                }
                            }.padding(.vertical)
                            HStack{
                                Text(product.name)
                                    .bold()
                                    .font(.title)
                                Spacer()
                            }.padding(.vertical)
                            HStack{
                                Text(product.detail)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Spacer()
                            }
                            Spacer()
                            HStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(Color("bgprice") )
                                    .frame(width:isAdd ? 0 : 148 , height:isAdd ? 0 : 76)
                                    .overlay{
                                        VStack(alignment: .leading){
                                            Text("Total price")
                                                .foregroundColor(.secondary)
                                            Text("\(String(format: "%.1f", totalPrice ))")
                                                .foregroundColor(.black)
                                                .bold()
                                                .font(.system(size: 22))
                                        }
                                    }
                            Spacer()
                                
                                Button(action: {isAdd = true
                                    add()
                                }, label: {
                                    RoundedRectangle(cornerRadius: 20)
                                        .foregroundColor(isAdd ? .green : Color("bgproduct") )
                                        .frame(width: isAdd ? .infinity : 148 , height:76)
                                        .overlay{
                                            HStack{
                                                Image(systemName: isAdd ? "checkmark.seal.fill" :"cart.fill")
                                                    .foregroundColor(isAdd ?.white :.green)
                                                Text(isAdd ? "SUCCESS" :"ADD TO CART")
                                                    .foregroundColor(.white)
                                                    .bold()
                                                    .font(.system(size: 15))
                                            }
                                        }/*.animation(isAdd ? .easeIn : .easeOut, value: isAdd)*/
                                })
                            }
                            
                        }.padding([.leading, .bottom, .trailing])

                    }
                            }
        }.ignoresSafeArea()
            .onReceive([self.count].publisher.first()) { _ in
                self.totalPrice = Double(self.count) * self.product.price
            }

    }
    private func decreaseCount() {
            if count > 1 {
                count -= 1
            }
        }
    
    private func add(){
        var newProduct = product
        newProduct.quality = count
        CartMV().addToCart(value: product) {
                
        }
    }
}

#Preview {
    BottomProduct(product: Product(name: "", detail: "", price: 10, quality: 10, star: 10, image: ""))
}
