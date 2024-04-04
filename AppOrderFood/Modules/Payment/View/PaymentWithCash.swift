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
    @Binding var isAccept:Bool
    @State var isRule = false
    @State var total = 100
    @State var address = "97 man thien hiep phu quan 8"
    var favoriteLandmarkTip = FavoriteLandmarkTip()
    var body: some View {
        NavigationStack{
//            ProgressView()
//                .progressViewStyle(.automatic)
            
            HStack{
                Text("TOTAL")
                    .bold()
                    .font(.title)
                    .foregroundStyle(.secondary)
                Spacer()
                Text("\(total)")
                    .bold()
                    .font(.title)
                    .foregroundStyle(.secondary)
            }.padding()
            HStack{
                Text("ADDRESS")
                    .bold()
                    .foregroundStyle(.secondary)
                Spacer()
                Text(address)
                    .bold()
                    .foregroundStyle(.secondary)
            }.padding()
            Spacer()
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
    PaymentWithCash(isAccept: .constant(false))
}
