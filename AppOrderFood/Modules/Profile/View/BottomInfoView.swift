//
//  BottomInfoView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 30/03/2024.
//

import SwiftUI

struct BottomInfoView: View {
    var body: some View {
        VStack{
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 150, height: 200)
                    .foregroundColor(Color(.bgcart))
                    .overlay{
                        VStack{
                            Text("100")
                                .bold()
                                .fontWeight(.heavy)
                                .font(.system(size: 60))
                                .foregroundColor(Color(.bginfo))
                            Text("Đơn hàng")
                                .foregroundColor(.secondary)
                        }
                    }
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 150, height: 200)
                    .foregroundColor(Color(.bgcart))
                    .overlay{
                        VStack{
                            Text("90%")
                                .bold()
                                .fontWeight(.heavy)
                                .font(.system(size: 60))
                                .foregroundColor(Color(.bginfo))
                            Text("Tỉ lệ thành công")
                                .foregroundColor(.secondary)
                        }
                    }
            }
            
            HStack{
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 150, height: 200)
                    .foregroundColor(Color(.bgcart))
                    .overlay{
                        VStack{
                            Text("100k")
                                .bold()
                                .fontWeight(.heavy)
                                .font(.system(size: 60))
                                .foregroundColor(Color(.bginfo))
                            Text("Số tiền đã trả")
                                .foregroundColor(.secondary)
                        }
                    }
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 150, height: 200)
                    .foregroundColor(Color(.bgcart))
                    .overlay{
                        VStack{
                            Text("100")
                                .bold()
                                .fontWeight(.heavy)
                                .font(.system(size: 60))
                                .foregroundColor(Color(.bginfo))
                            Text("Đơn hàng")
                                .foregroundColor(.secondary)
                        }
                    }
            }
        }.background(Color("bgproduct"))
    }
}

#Preview {
    BottomInfoView()
}
