//
//  DiscountAddView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 17/04/2024.
//

import SwiftUI
import Firebase

struct DiscountAddView: View {
    @State var discount: Discount = Discount(code: "", name: "", percent: 0.0, dueday: Timestamp(date: Date()), image: "")
    @State var isSubmit = false
    
    var body: some View {
        VStack {
            TextField("Code", text: $discount.code)
            TextField("Name", text: $discount.name)
            TextField("Percent", value: $discount.percent, formatter: NumberFormatter())
            DatePicker("Due Date", selection: Binding<Date>(
                get: { self.discount.dueday.dateValue() },
                set: { self.discount.dueday = Timestamp(date: $0) }
            ), displayedComponents: .date)
            TextField("Image", text: $discount.image)
            Button(action: {
                add()
            }, label: {
                Text("Add Discount")
            })
        }
        .padding()
    }
    
    func add() {
        DiscountMV().addDiscount(value: discount)
    }
}


#Preview {
    DiscountAddView()
}
