//
//  CartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 08/03/2024.
//

import SwiftUI

struct CartView: View {
    @State var products  = MockProductCartModel.products
    @State var discounts = MockDiscount.discounts
    @State var isDisscount = false
    @State var isDiscountShown = false
    @State var disount = ""
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading){
                        Text("My")
                            .font(.system(size: 20))
                        Text("Cart list")
                            .font(.system(size: 25))
                    }.bold()
                    Spacer()
                }.padding([.top, .leading], 50)
                ListCartView(products : products)
                    .padding(.horizontal)
                //.frame(width: .infinity, height: 400)
                Button(action: {isDiscountShown = true}, label: {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(.white)
                        .frame(width: .infinity, height: 50)
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
                }).padding(.horizontal)
                BottomCartView()
                NavigationLink(
                    destination: ListDiscount(discounts: discounts ), // Điều hướng đến ListDiscountView
                    isActive: $isDiscountShown, // Kiểm tra trạng thái hiển thị của ListDiscountView
                    label: {
                        EmptyView() // Đây là một NavigationLink rỗng, nó sẽ không hiển thị gì trên giao diện
                    })
                    .hidden()
                
            }
            .ignoresSafeArea()
            .background(Color("bgcart"))
        }
    }
}

#Preview {
    CartView()
}

