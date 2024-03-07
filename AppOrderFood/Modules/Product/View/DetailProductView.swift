//
//  DetailProductView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import SwiftUI

struct DetailProductView: View {
    @State var product = MockDetailProduct.product
    @State var isAddToCart = false
    @State var quality = 1
    @State var isMuch = false
    @State private var selection = "M"
    @State var selectionValue = 0
        let size: [String: Double] = ["M": 1, "S": 2, "L": 3, "XL": 4]
    var body: some View {
        VStack {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            .frame(height: 400, alignment: .topLeading)
        
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
                    Picker("Select a size", selection: $selection) {
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
                        if(quality <= 1){
                            quality = 1
                        }else{
                            quality -= 1
                        }
                    }, label: {
                        Text("-")
                    })
                    .padding(.leading)
                    .foregroundColor(.black)
                    Divider().frame(height: 40)
                    
                    Text("\(quality)")
                        .font(.system(size: 20))
                    Divider().frame(height: 40)
                    Button(action: {
                        if(product.quality <= quality){
                            quality = product.quality
                            isMuch = true
                            
                        }else{
                            quality += 1
                            isMuch = false
                        }
                        
                        
                    }, label: {
                        Text("+")
                    })
                    .padding(.trailing)
                    .foregroundColor(.black)
                    
                }.background(Color.yellow).cornerRadius(10)
                    .padding()
                
            }
            HStack{
                Spacer()
                Text(isMuch ? "Out of Stock":"" )
                    .font(.system(size: 10))
                    .foregroundColor(.red)
                    .padding(.trailing)
            }
            Spacer()
            Divider()
            HStack{
                let fortmatTotal = String(format: "%.1f", product.price * Double(quality) * (size[selection] ?? product.price * Double(quality)))
                Text("Total : \(fortmatTotal) VND")
                    .font(.system(size: 20).bold())
                    .padding(.leading)
                Spacer()
                Button(action: {isAddToCart = true}, label: {
                    Text(isAddToCart ? "ADD COMPLETE":"ADD TO CART")
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

#Preview {
    DetailProductView()
}
