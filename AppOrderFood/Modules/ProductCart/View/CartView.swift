//
//  CartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 08/03/2024.
//

import SwiftUI

struct CartView: View {
    @State var isAddToCart = false
    @State var total:Double = 0
 
    @State var products : [ProductCartModel] = [MockProductCartModel.product1, MockProductCartModel.product1, MockProductCartModel.product1, MockProductCartModel.product1, MockProductCartModel.product1, MockProductCartModel.product1, MockProductCartModel.product1,MockProductCartModel.product1, MockProductCartModel.product1]
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .cornerRadius(40)
                    .frame(height: 100)
               
                Text("CART")
                    .padding(.top)
                    .foregroundColor(.white)
                    .font(.title.bold())
            }
            .ignoresSafeArea()
            List {
               ForEach(products) { product in
                   ItemCartView(product: product)
               }
               .onDelete(perform: delete)
           }.listStyle(PlainListStyle())
            Divider()
                    HStack{
                        let fortmatTotal = String(format: "%.1f", total)
                        Text("Total : \(fortmatTotal) VND")
                            .font(.system(size: 20).bold())
                            .padding(.leading)
                        Spacer()
                        Button(action: {isAddToCart = true}, label: {
                            Text(isAddToCart ? "ORDER NOW":"ORDER NOW")
                            Image(systemName: isAddToCart ? "checkmark.seal.fill":"arrow.right.circle")
                            
                            
                        }).padding()
                            .background(isAddToCart ? Color.green: Color.pink)
                            .cornerRadius(20)
                            .foregroundColor(.white)
                            .bold()
                            .frame(maxWidth: .infinity)
                            .animation(.easeInOut(duration: 1),value: isAddToCart)
                        
                    }.ignoresSafeArea()
        }
    }
    func delete(at offsets: IndexSet) {
        products.remove(atOffsets: offsets)
        }
}

#Preview {
    CartView()
}
