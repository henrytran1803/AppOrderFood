//
//  CartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 08/03/2024.
//

import SwiftUI

struct CartView: View {
    @State var products  = MockProductCartModel.products
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading){
                    Text("My")
                        .font(.system(size: 20))
                    Text("Cart list")
                        .font(.system(size: 25))
                }.bold()
                Spacer()
            }.padding([.top, .leading], 34.0)
           ListCartView(products : products)
                .padding(.horizontal)
                //.frame(width: .infinity, height: 400)
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                    .frame(width: .infinity, height: 70)
                    .overlay{
                        HStack{
                            Image(systemName: "umbrella.percent.fill")
                                .foregroundColor(Color("bgbutton"))
                                .font(.system(size: 20))
                                .padding(.horizontal)
                            Text("Bạn có mã giảm giá ư?")
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                            
                        }
                    }
            }).padding(.all)
            BottomCartView()
                
        }
        .ignoresSafeArea()
        .background(Color("bgcart"))
      }
}

#Preview {
    CartView()
}

