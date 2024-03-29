//
//  ItemCartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 08/03/2024.
//
import SwiftUI

struct ItemCartView: View {
    @State var product : ProductCartModel
    @State private var totalPrice: Double = 0
  @State var count = 1
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .frame(width: .infinity,height: 100)
                .overlay{
                    HStack{
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(Color("bgproduct"))
                            .frame(width: 80, height: 80)
                            .overlay{
                                Image("\(product.image)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:  80)
                                
                            }
                        VStack(alignment: .leading){
                            Text("\(product.name)")
                                .font(.system(size: 23))
                            Text("\(String(format: "%.1f", totalPrice ))")
                                .bold()
                                .font(.system(size:20))
                        }
                        VStack{
                            Spacer()
                            HStack{
                                Button(action: {decreaseCount()}, label: {
                                    Image(systemName: "minus.square.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color("bgbutton"))

                                })
                                Text("\(product.quality)")
                                Button(action: {product.quality += 1}, label: {
                                    Image(systemName: "plus.square.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color("bgbutton"))
                                })
                            }
                        }
                    }
                }
        }.onReceive([self.count].publisher.first()) { _ in
            self.totalPrice = Double(self.product.quality) * self.product.price
        }
    }
    private func decreaseCount() {
            if product.quality > 1 {
                product.quality -= 1
            }
        }


}

struct ItemCartView_Previews: PreviewProvider {
    static var previews: some View {
        ItemCartView(product: MockProductCartModel.products[1])
    }
}
