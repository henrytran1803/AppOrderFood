//
//  UpdateProductCartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 08/03/2024.
//

import SwiftUI

struct UpdateProductCartView: View {
    @Binding var isSheetPresented: Bool
    @Binding var product: ProductCartModel
    @Binding var cart: [ProductCartModel] 
    @State var isAddToCart = false
    @State private var selection = "M"
    @State var selectionValue = 0
        let size: [String: Double] = ["M": 1, "S": 2, "L": 3, "XL": 4]
    var body: some View {
        VStack {
            ScrollView{
                Image(product.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 100, alignment: .topLeading)
                
                Divider()
                    .frame(height: 3)
                    .overlay(.black)
                HStack {
                    Text(product.name)
                        .font(.title)
                        .padding()
                }.frame(maxWidth: .infinity,alignment: .leading)
                HStack{
                    Text(product.category)
                        .font(.subheadline)
                    Spacer()
                    let fortmatPrice = String(format: "%.1f", product.price * (size[selection] ?? product.price))
                    Text("Price: \(fortmatPrice) VND")
                        .foregroundColor(.red)
                }.padding()
                
                Divider()
                HStack{
                    HStack{
                        Text("Size")
                            .padding(.leading)
                        
                        Divider().frame(height: 40)
                        Picker("", selection: $product.size) {
                            ForEach(Array(size.keys.sorted()), id: \.self) { key in
                                Text("\(key)")
                            }
                        }
                        .pickerStyle(.menu)
                        .foregroundColor(.blue)
                    }.background(Color.blue.secondary)
                        .cornerRadius(10)
                        .padding()
                    Spacer()
                    HStack{
                        Button(action:  {
                            if(product.quality <= 1){
                                product.quality = 1
                            }else{
                                product.quality -= 1
                            }
                        }, label: {
                            Text("-")
                        })
                        .padding(.leading)
                        .foregroundColor(.black)
                        Divider().frame(height: 40)
                        
                        Text("\(product.quality)")
                            .font(.system(size: 20))
                        Divider().frame(height: 40)
                        Button(action: {
                            product.quality += 1
                            
                        }, label: {
                            Text("+")
                        })
                        .padding(.trailing)
                        .foregroundColor(.black)
                        
                    }.background(Color.yellow).cornerRadius(10)
                        .padding()
                    
                }
                Spacer()
            }
            Divider()
            HStack{
                let fortmatTotal = String(format: "%.1f", product.price * Double(product.quality) * (size[product.size] ?? product.price * Double(product.quality)))
                Text("Total : \(fortmatTotal) VND")
                    .font(.system(size: 20).bold())
                    .padding(.leading)
                Spacer()
                Button(action: {
                    if let index = cart.firstIndex(where: { $0.id == product.id }) {
                           cart[index] = product
                       }
                    isAddToCart = true
                    isSheetPresented = false
                }, label: {
                    Text(isAddToCart ? "ADD COMPLETE":"UP DATE CART")
                    Image(systemName: isAddToCart ? "checkmark.seal.fill":"cart")
                    
                }).padding()
                .background(isAddToCart ? Color.green: Color.pink)
                .cornerRadius(20)
                .foregroundColor(.white)
                .bold()
                .frame(maxWidth: .infinity)
                .animation(.easeInOut(duration: 1),value: isAddToCart)
        
            }
        }

    }
}

//#Preview {
//    UpdateProductCartView(isSheetPresented: isSheetPresented = false, product: MockProductCartModel.product1)
//}
