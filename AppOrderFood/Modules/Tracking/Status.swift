//
//  Status.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/04/2024.
//

import SwiftUI
import Firebase
struct Status: View {
    @Binding var order: Oder
    @Binding var height: CGFloat
    @State var progress: CGFloat = 0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        let screenHeight = screenSize.height
        RoundedRectangle(cornerRadius: 25)
            .frame(width: .infinity, height: screenHeight * height)
            .foregroundColor(Color.bgcart)
            .overlay{
                VStack{
                    HStack{
                        Image(systemName: order.status == .pendding ? "shippingbox.fill" : "shippingbox")
                            .foregroundColor(order.status == .done ? .green : .white)
                        Rectangle()
                            .frame(width:order.status == .pendding ? progress : 0 , height: 1)
                            .foregroundColor(order.status == .done ? .green : .white)
                        Image(systemName: order.status == .pendding ?  "truck.box.badge.clock.fill" : "")
                            .foregroundColor(order.status == .done ? .green : .white)
                    }.frame(width: 200)
                        .border(Color.black)
                        .background(.black)
                        .cornerRadius(20)
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text("Trạng thái:")
                            if order.status == .pendding {
                                Text("Đang đóng gói")
                            } else if order.status == .done{
                                Text("Hoàn thành")
                            } else {
                                Text("Đợi thanh toán")
                            }
                        }
                        Text("Tên người nhận: \(order.name)")
                        Text("Địa chỉ: \(order.adress)")
                    }
                    
                    
                }
                .onReceive(timer) { _ in
                    withAnimation {
                        if self.progress < 100 {
                            self.progress += 1
                        } else {
                            self.progress = 0
                        }
                    }
                }
            }
    
    }
    
}


#Preview {
    Status(order:.constant( Oder(name: "anh", adress: "blabla", total: 100, discount: 100, date: Timestamp(date: Date()), products: [], status: .no, payment: .applePay)), height: .constant(200))
}
