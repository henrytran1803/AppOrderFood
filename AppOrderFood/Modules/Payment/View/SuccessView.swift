//
//  SuccessView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 03/04/2024.
//

import SwiftUI
import Firebase
struct SuccessView: View {
    @State var tracking = false
    @Binding var order: Oder
    @ObservedObject var orderMV:OrderMV = OrderMV()
   
    var body: some View {
        VStack{
            Text("Hoàn thành đơn hàng")
                .bold()
                .font(.title)
                .foregroundStyle(.secondary)
            Image(systemName: "checkmark.seal.fill")
                .foregroundColor(.green)
                .font(.system(size: 40))
            InforOrder(order: $order)
            Button(action: {
                tracking = true
            
            }, label: {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color("bgproduct"))
                    .frame(width: .infinity, height: 60)
                    .overlay{
                        HStack{
                            Text("THEO DOI DON HANG")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Image(systemName: "map.fill")
                                .foregroundColor(Color("bgbutton"))
                                .font(.system(size: 20))
                        }
                    }
            })
        }.onAppear{
            OrderMV().deleteDocument()
            nofication()
        }
        .fullScreenCover(isPresented: $tracking, content: {
            TrackingView(order: order)
        })
    }
    func nofication(){
        let content = UNMutableNotificationContent()
        content.title = "Đặt hàng thành công"
        content.subtitle = "Đợi nhé"
        content.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        print("run")
    }
}

#Preview {
    SuccessView(order: .constant( Oder(name: "name", adress: "nbalna", total: 100, discount: 10, date: Timestamp(date: Date()), products: [], status: .done, payment: .applePay)))
}
