//
//  buttonWelcome.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 26/03/2024.
//

import Foundation
import SwiftUI


struct ButtonStyleWelcome : View {
    var icon: String
    var title: String
    var action :()->Void
    
    
    var body: some View {
        Button{
            withAnimation {
                action()
            }
        }label: {
            HStack{
                if !icon.isEmpty {
                    Image(icon).resizable()
                        .frame(width: 30,height: 30)
                }
                Text(title).font(.title2)
                
            }
        }.foregroundStyle(.black)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(.white, in:.rect(cornerRadius: 30))
            .overlay{
                RoundedRectangle(cornerRadius: 30)
                    .stroke(lineWidth: 0.1)
                    .foregroundStyle(.black)
            }
            
    }
}
