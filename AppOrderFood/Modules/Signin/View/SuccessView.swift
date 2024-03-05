//
//  SuccessView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/03/2024.
//

import SwiftUI

struct SuccessView: View {
    var body: some View {
        VStack{
            Image("cloud1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 100, alignment: .topLeading)
            Text("SUCCESS")
                .font(.system(size: 40).bold())
                .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.629, green: 0.824, blue: 0.979)/*@END_MENU_TOKEN@*/)
            Image("success")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 400, alignment: .topLeading)
            Image("cloud1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200, alignment: .topLeading)

            
        }
    }
}

#Preview {
    SuccessView()
}
