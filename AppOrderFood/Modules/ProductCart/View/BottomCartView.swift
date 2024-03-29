//
//  BottomCartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import SwiftUI

struct BottomCartView: View {
    var body: some View {
    
        VStack{
            Spacer()
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .frame(width: .infinity,height: 350)
                .overlay{
                    VStack{
                        HStack{
                            Text("Subtotal")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("1000")
                                .bold()
                                .font(.system(size: 20))
                        }.padding([.leading, .bottom, .trailing])
                        HStack{
                            Text("Discount")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("1000")
                                .bold()
                                .font(.system(size: 20))
                        }.padding([.leading, .bottom, .trailing])
                        HStack{
                            Text("Delivery")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("1000")
                                .bold()
                                .font(.system(size: 20))
                        }.padding([.leading, .bottom, .trailing])
                        Divider()
                        HStack{
                            Text("Total")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("1000")
                                .bold()
                                .font(.system(size: 20))
                        }.padding([.leading, .bottom, .trailing])
                        
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundColor(Color("bgproduct"))
                                .frame(width: .infinity, height: 80)
                                .overlay{
                                    HStack{
                                        Text("Checkout")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                        Image(systemName: "arrowtriangle.right.fill")
                                            .foregroundColor(Color("bgbutton"))
                                            .font(.system(size: 20))
                                    }
                                }
                        }).padding([.leading, .bottom, .trailing])
                    }
                    
                    
                }
        }.ignoresSafeArea()
    }
}

#Preview {
    BottomCartView()
}
