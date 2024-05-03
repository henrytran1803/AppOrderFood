//
//  BottomInfoView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 30/03/2024.
//
import Charts
import SwiftUI
struct ValuePerCategory {
    var category: String
    var value: Int
}
struct BottomInfoView: View {
    @State var countSuccess = 0
    @State var count = 0
    @State var countFail = 0
    var body: some View {
        VStack{
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 150, height: 200)
                    .foregroundColor(Color(.bgcart))
                    .overlay{
                        VStack{
                            Text("\(count)")
                                .bold()
                                .fontWeight(.heavy)
                                .font(.system(size: 60))
                                .foregroundColor(Color(.bginfo))
                            Text("Đơn hàng")
                                .foregroundColor(.secondary)
                        }
                    }
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 150, height: 200)
                    .foregroundColor(Color(.bgcart))
                    .overlay{
                        let data: [ValuePerCategory] = [
                            .init(category: "Tổng", value: count),
                            .init(category: "Success", value: countSuccess),
                            .init(category: "Fail", value: countFail)
                        ]
                        Chart(data, id: \.category) { item in
                            BarMark(
                                x: .value("Category", item.category),
                                y: .value("Value", item.value)
                            )
                        }.frame(width: 100, height: 170)
                    }
            }
        }.background(Color("bgproduct"))
            .onAppear{
                OrderMV().fetchDoneOrdersCountFail{ count in
                    self.countFail = count
                    
                }
                OrderMV().fetchDoneOrdersCount{count in
                    self.count = count
                    
                }
                OrderMV().fetchDoneOrdersCountDone{count in
                    self.countSuccess = count
                    
                }
            }
    }
}

#Preview {
    BottomInfoView()
}
