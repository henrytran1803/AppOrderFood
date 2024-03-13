//
//  ItemCartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 08/03/2024.
//
import SwiftUI

struct ItemCartView: View {
    @State private var selection = "M"
    @State var selectionValue = 0
    let size: [String: Double] = ["M": 1, "S": 2, "L": 3, "XL": 4]
    @State var product: ProductCartModel
    var body: some View {
        HStack{
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 80)
                .padding(.leading)
            VStack(alignment: .leading) {
                Text(product.name)
                Text(product.category)
                    .font(.system(size: 10))
                HStack{
                    Text("Size \(product.size)")
                        .padding()
                        .font(.system(size: 10))
                    
                }.foregroundColor(.blue)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(20)
            }
            .cornerRadius(20)
            
            Spacer()
            VStack {
                HStack{
                    
                    Text("\(product.quality)")
                        .font(.system(size: 15))
                        .padding()
                }.background(Color.yellow)
                    .cornerRadius(12)
                Text("Total: \(String(format: "%.1f", totalPrice())) VND")
                    .font(.system(size: 10))
                    .foregroundColor(.red)
                
            }
        }
                .padding(.trailing)

        }
    private func totalPrice() -> Double {
        return product.price * Double(product.quality) * (size[product.size] ?? 1)
    }
}

struct ItemCartView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCartView(product: MockProductCartModel.product1)
    }
}
