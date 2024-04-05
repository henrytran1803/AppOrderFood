//
//  Status.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/04/2024.
//

import SwiftUI

struct Status: View {
    @Binding var height: CGFloat
    @State var isGetReady = false
    @State var progress: CGFloat = 0
    @State var isSuccess = false
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
                        Image(systemName: isGetReady ? "shippingbox.fill" : "shippingbox")
                            .foregroundColor(isSuccess ? .green : .white)
                        Rectangle()
                            .frame(width:isGetReady ? progress : 0 , height: 1)
                            .foregroundColor(isSuccess ? .green : .white)
                        Image(systemName: isGetReady ?  "truck.box.badge.clock.fill" : "")
                            .foregroundColor(isSuccess ? .green : .white)
                    }.frame(width: 200)
                        .border(Color.black)
                        .background(.black)
                        .cornerRadius(20)
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text("Trạng thái:")
                            if isGetReady {
                                Text("Đang trên đường giao đến bạn")
                            } else {
                                Text("Đăng đóng gói")
                            }
                        }
                        Text("Mã đơn hàng: ")
                        Text("Thời gian giao dự kiến: ")
                        Text("Tên tài xế: ")
                        Text("SDT: ")
                        Text("Biển số xe: ")
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
    Status(height: .constant(200))
}
