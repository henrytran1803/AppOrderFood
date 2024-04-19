//
//  CartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 08/03/2024.
//

import SwiftUI
import Firebase
struct CartView: View {
    @State var products: [Product] = []
    @State var codeDiscount = ""
    @State var percentDiscount : Double = 0
    @State var isDisscount = false
    @State var isDiscountShown = false
    @State var disount = ""
    @State var isCheckout = false
    @State var percent : Double = 0
    @State var total: Double = 0
    @ObservedObject var cart = CartMV()

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
                ListCartView(products: $products, cart: cart,total: $total)
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
                                if codeDiscount.isEmpty {
                                    Text("Bạn có mã giảm giá ư?")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                }else {
                                    Text("\(codeDiscount), \(percentDiscount)")
                                        .foregroundColor(.black)
                                        .font(.system(size: 20))
                                }
                            }
                        }
                }).padding(.horizontal)
                BottomCartView(total: $total, discount: $percentDiscount, isCheckout: $isCheckout)
                NavigationLink(
                    destination: ListDiscount(isDiscountShown: $isDiscountShown, codeDiscount: $codeDiscount, percenDiscount: $percentDiscount),
                    isActive: $isDiscountShown,
                    label: {
                        EmptyView()
                    })
                    .hidden()
                
            }
            .ignoresSafeArea()
            .background(Color("bgcart"))
        }.sheet(isPresented: $isCheckout, content: {
            let order =  payment() // Sử dụng await để đợi cho phương thức payment() hoàn tất
            MainPayment(order: order)
                .presentationDetents([.height(550), .large])
                .presentationDragIndicator(.automatic)
        }).onAppear {
            cart.fetchProductCart { products in
                self.products = products
                total = cart.total
            }
        }

        
    }
    private func updatePercent() {
        print("\(percentDiscount)    \(total)")
        percent = (percentDiscount * total) / 100
    }
    private func payment() -> Oder{

        let user = InfoUser()
        user.fetchUser()
        sleep(2)
        let order : Oder = Oder(name: "", adress: "", total: total, discount: percentDiscount, date: Timestamp(date: Date()), products: products, status: .no, payment: .cash)
        print(order)
        return order
    }
}

#Preview {
    CartView()
}

