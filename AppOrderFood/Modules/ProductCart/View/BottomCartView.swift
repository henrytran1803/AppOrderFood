//
//  BottomCartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import SwiftUI

struct BottomCartView: View {
    @Binding var total: Double
    @Binding var discount: Double
    @Binding var isCheckout:Bool
    var body: some View {
    
        VStack{
            Spacer()
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
                .frame(width: .infinity,height: 380)
                .overlay{
                    VStack{
                        HStack{
                            Text("Subtotal")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("\(String(format: "%.2f",total))")
                                .bold()
                                .font(.system(size: 20))
                        }.padding([.leading, .bottom, .trailing])
                        HStack{
                            Text("Discount")
                                .foregroundColor(.secondary)
                            Spacer()
                            let dis = total * discount / 100
                            Text("\(String(format: "%.2f",dis))")
                                .bold()
                                .font(.system(size: 20))
                        }.padding([.leading, .bottom, .trailing])
                        HStack{
                            Text("Delivery")
                                .foregroundColor(.secondary)
                            Spacer()
                            Text("NULLLLL")
                                .bold()
                                .font(.system(size: 20))
                        }.padding([.leading, .bottom, .trailing])
                        Divider()
                        HStack{
                            Text("Total")
                                .foregroundColor(.secondary)
                            Spacer()
                            let discountedTotal = total - (total * discount / 100)
                            Text("\(String(format: "%.2f",discountedTotal))")
                                .bold()
                                .font(.system(size: 20))
                        }.padding([.leading, .bottom, .trailing])
                        
                        
                        Button(action: {isCheckout = true}, label: {
                            RoundedRectangle(cornerRadius: 25.0)
                                .foregroundColor(Color("bgproduct"))
                                .frame(width: .infinity, height: 60)
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
                        }).padding([.leading, .trailing])
                            .padding(.bottom, 70)
                            .disabled(total == 0 ? true : false)
                            
                    }
                    
                    
                }
        }.ignoresSafeArea()
    }
}

#Preview {
    BottomCartView(total: .constant(10), discount: .constant(10),  isCheckout: .constant(true))
}
