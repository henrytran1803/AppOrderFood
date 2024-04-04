//
//  PaymentWithCash.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 04/04/2024.
//

import SwiftUI
import TipKit


struct FavoriteLandmarkTip: Tip {
    var title: Text {
        Text("Điều khoản.")
    }


    var message: Text? {
        Text("Chấp nhận điều khoản để tiếp tục hoàn thành đơn hàng.")
    }


    var image: Image? {
        Image(systemName: "book.pages")
    }
}
struct PaymentWithCash: View {
    @State var isAccept = false
    @State var isRule = false
    var favoriteLandmarkTip = FavoriteLandmarkTip()
    var body: some View {
        NavigationStack{
//            ProgressView()
//                .progressViewStyle(.automatic)
            
            
            TipView(favoriteLandmarkTip, arrowEdge: .bottom)
            HStack{
                Button(action: {isAccept.toggle()}, label: {
                    Image(systemName: isAccept ? "checkmark.square.fill" : "checkmark.square")
                        .foregroundColor(.black)
                })
                Text("Chấp nhận")
                Text("Điều khoản")
                    .bold()
                    .onTapGesture {
                        self.isRule = true
                    }
                NavigationLink(destination: RuleView(), isActive: self.$isRule) {
                    EmptyView()
                }
               
            }
            Button(action: {}, label: {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color("bgproduct"))
                    .frame(width: .infinity, height: 60)
                    .overlay{
                        HStack{
                            Text("NEXT")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                            Image(systemName: "arrowtriangle.right.fill")
                                .foregroundColor(Color("bgbutton"))
                                .font(.system(size: 20))
                        }
                    }
            }).disabled(!isAccept)
            .padding([.leading, .trailing])
                .padding(.bottom, 70)
            .task {
                try? Tips.configure([
                    .displayFrequency(.immediate),
                    .datastoreLocation(.applicationDefault)
                ])
            }
        }
    }
}

#Preview {
    PaymentWithCash()
}
