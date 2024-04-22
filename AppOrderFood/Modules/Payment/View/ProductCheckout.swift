//
//  ProductCheckout.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 03/04/2024.
//

struct RadioButtonView: View {
    
    let currentRadioValue: String
    let callbackForSelection: (String)->()
    let prevselectedValue : String
    
    init(
        _ id: String,
        callback: @escaping (String)->(),
        selectedID: String
    ) {
        self.currentRadioValue = id
        self.prevselectedValue = selectedID
        self.callbackForSelection = callback
    }
    
    var body: some View {
        Button(action:{
            self.callbackForSelection(self.currentRadioValue)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: self.prevselectedValue == self.currentRadioValue ? "largecircle.fill.circle" : "circle")
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 18, height: 18)
                Text(currentRadioValue)
                Spacer()
                Image("\(currentRadioValue)")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
            }
        }

    }

}
struct RadioButtons: View {
    
    let items : [String]
    let callbackForSelection: (String) -> ()
    @State var selectedId: String = ""
    
    var body: some View {
        List {
            ForEach(0..<items.count, id: \.self) { index in
                RadioButtonView(self.items[index],
                                callback: self.radioGroupCallback,
                                selectedID: self.selectedId)
            }

        }.listStyle(.inset)
            .frame(height: 150)
        
    }
    
    func radioGroupCallback(id: String) {
        selectedId = id
        callbackForSelection(id)
    }
}

import SwiftUI

struct ProductCheckout: View {
    @Binding var isCheckout : checkout
    @Binding var order : Oder
    @State var objectsArray = ["ApplePay", "Crypto", "Cash"]
    @Binding var selectedRadioButton : String
    @ObservedObject var orderMV :OrderMV 
    var body: some View {
        VStack{
            
            HStack{
                Text("Total:")
                    .bold()
                    .font(.system(size: 30))
                Spacer()
                Text("\(String(format: "%.2f",order.total)) VND")
            }.foregroundColor(.secondary)
            HStack{
                Text("Discount:")
                    .bold()
                    .font(.system(size: 30))
                Spacer()
                Text("\(String(format: "%.2f",order.discount)) %")
            }.foregroundColor(.secondary)
            Text("Select payment method")
                .foregroundColor(.black)
            
            RadioButtons(items: objectsArray,
                         callbackForSelection:  { selectedVal in
                print("Selected Value  -- : \(selectedVal)")
                selectedRadioButton = selectedVal
            },selectedId: selectedRadioButton)
            
            Text("Selected:  \(selectedRadioButton)")
            Button(action: {isCheckout = .payment
                add()
            }, label: {
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
            }).padding([.leading, .trailing])
                .padding(.bottom, 70)
        }

    }
    func add(){
        var status : Payment = .cash
        if selectedRadioButton == "Cash" {
            status = .cash
        }else if selectedRadioButton == "Crypto" {
            status = .crypto
        }
        order.payment = status
        orderMV.addOrder(value: order)
        
    }

}

//#Preview {
//    ProductCheckout( isCheckout: .constant(.checkout), selectedRadioButton: .constant("ApplePay") )
//}
