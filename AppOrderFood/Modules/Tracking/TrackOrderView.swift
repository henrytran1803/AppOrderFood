//
//  TrackOrderView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 22/04/2024.
//

import SwiftUI
import Firebase
struct TrackOrderView: View {
    @ObservedObject var orderMV:OrderMV = OrderMV()
    @State var isOpen = false
    @State var order :Oder = Oder(name: "", adress: "", total: 10, discount: 10, date: Timestamp(date: Date()), products: [], status: .done, payment: .applePay)
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(width: .infinity, height: 80)
            .foregroundColor(Color("bgproduct"))
            .overlay{
                HStack{
                    Image("Image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50)
                    Spacer()
                    VStack{
                        Text("Đang trên đường giao đến bạn")
                        Text("Chạm vào để xem chi tiết")
                    }.foregroundColor(.white)
                        .bold()
                }.padding()
            }.onTapGesture {
                isOpen.toggle()
            }
            .fullScreenCover(isPresented: $isOpen, content: {
                TrackingView(order: order)
            })
            .onAppear{
                loadOrder()
            }
    }
    func loadOrder(){
        let docu : String  = UserDefaults.standard.string(forKey: "order") ?? "none"
        orderMV.getOrder(document: docu) { order in
            if let order = order {
                self.order = order
            } else {
                print("eo co")
            }
        }
    }
}

#Preview {
    TrackOrderView()
}
