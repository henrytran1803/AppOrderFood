//
//  ItemCartView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 08/03/2024.
//
import SwiftUI

struct ItemCartView: View {
    @ObservedObject var cart: CartMV
    @Binding var product : Product
    @State private var totalPrice: Double = 0
    @Binding var total: Double
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
                                
                                AsyncImage(url: URL(string: product.image)) { image in
                                    image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 80)
                            }
                        Spacer()
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
                                .buttonStyle(PlainButtonStyle())
                                Text("\(count)")
                                Button(action: {increaseCount()}, label: {
                                    Image(systemName: "plus.square.fill")
                                        .font(.system(size: 30))
                                        .foregroundColor(Color("bgbutton"))
                                })
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
        }.onReceive([self.count].publisher.first()) { _ in
            self.totalPrice = Double(self.product.quality) * self.product.price
        }
    }
    private func decreaseCount() {
        if count > 1 {
            count -= 1
            let oldTotal = self.total
            updateCart {
                // Giảm total bằng cách trừ đi giá của một sản phẩm.
                self.total = oldTotal - self.product.price
                print("update: \(self.total)")
            }
        }
    }

    private func increaseCount() {
        count += 1
        let oldTotal = self.total
        updateCart {
            self.total = oldTotal + self.product.price
            print("update: \(self.total)")
        }
    }

    private func updateCart(completion: @escaping () -> Void) {
        var productnew = product
        productnew.quality = count
        cart.addToCart(value: product) {
            completion()
        }
    }

}

//struct ItemCartView_Previews: PreviewProvider {
//    static var previews: some View {
//        ItemCartView(product: Product(name: "", detail: "", price: 10, quality: 10, star: 10, image: ""))
//    }
//}
