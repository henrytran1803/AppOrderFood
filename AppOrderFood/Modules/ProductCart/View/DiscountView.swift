//
//  DiscountView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import SwiftUI

struct DiscountView: View {
    @State var discount : DiscountModel
    var body: some View {
        DiscountShape()
            .overlay{
                HStack{
                    Image("\(discount.image)")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:  70)
                        .padding(.leading, 30)
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                        .frame(width: 1, height: 80)
                        .foregroundColor(.secondary)
                    
                    VStack(alignment: .leading){
                        Text("\(String(format: "%.1f", discount.percent )) OFF")
                            .bold()
                        Text("\(discount.name)")
                        Text("Valid untill \(discount.duedate.formatted(.dateTime.day().month().year()))")
                            .font(.system(size: 10))
                            .foregroundStyle(.secondary)
                    }
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                        .frame(width: 120, height: 20)
                        .foregroundColor(.secondary)
                        .padding(.trailing, 40)
                        .overlay{
                            Text("\(discount.code)")
                                .foregroundStyle(.secondary)
                        }
                }
            }
    }
}


struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView(discount: MockDiscount.discounts[1])
    }
}

