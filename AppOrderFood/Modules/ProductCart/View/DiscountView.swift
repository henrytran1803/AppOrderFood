//
//  DiscountView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/03/2024.
//

import SwiftUI

struct DiscountView: View {
    @State var discount : Discount
    var body: some View {
        DiscountShape()
            .overlay{
                HStack{
                    AsyncImage(url: URL(string: discount.image)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .aspectRatio(contentMode: .fit)
                    .frame(width:  70)
                    .padding(.leading, 25)
                    Rectangle()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [6]))
                        .frame(width: 1, height: 80)
                        .foregroundColor(.secondary)
                    
                    VStack(alignment: .leading){
                        Text("\(String(format: "%.1f", discount.percent )) OFF")
                            .bold()
                        Text("\(discount.name)")
                        Text("Hết hạn vào \(discount.dueday)")
                            .font(.caption)
                            .foregroundColor(.secondary)


                        


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
    func formatTimestamp(timestamp: TimeInterval) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        let date = Date(timeIntervalSince1970: timestamp)
        return dateFormatter.string(from: date)
    }
}


//struct DiscountView_Previews: PreviewProvider {
//    static var previews: some View {
//        DiscountView(discount: Discount(code: "", name: "", percent: 0, dueday: Date(), image: ""))
//    }
//}

