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
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @State var progress: CGFloat = 0
    @State var order :Oder = Oder(name: "", adress: "", total: 10, discount: 10, date: Timestamp(date: Date()), products: [], status: .done, payment: .applePay)
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .frame(width: 380, height: 70)
            .foregroundColor(Color("bgproduct"))
            .overlay{
                HStack{
                    Rectangle()
                        .frame(width: progress, height: 1)
                        .foregroundColor(Color("bgproduct"))
                    Image(Int(progress) % 3 == 0 ? "1" : Int(progress) % 3 == 1 ? "2" : "3")
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
            .onReceive(timer) { _ in
                withAnimation {
                    if self.progress < 50 {
                        self.progress += 1
                    } else {
                        self.progress = 0
                    }
                }
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
