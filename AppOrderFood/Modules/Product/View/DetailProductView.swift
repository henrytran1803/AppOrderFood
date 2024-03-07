//
//  DetailProductView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 07/03/2024.
//

import SwiftUI

struct DetailProductView: View {
    var body: some View {
        VStack {
            Image("hamburger")
                .resizable()
                .aspectRatio(contentMode: .fit)
            .frame(height: 400, alignment: .topLeading)
        
        Divider()
            .frame(height: 3)
            .overlay(.black)
        Text("Name burger")
        Text("Categry")
            Text("Price: 1232123")
            Divider()
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Size")
                })
                HStack{
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("+")
                    })
                    .padding(.leading)
                    .foregroundColor(.black)
                    Divider().frame(height: 20)
                    Text("1")
                    Divider().frame(height: 20)
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                        Text("-")
                    })
                    .padding(.trailing)
                    .foregroundColor(.black)
                    //.frame(width: 20.0, height: 20.0)
                    
                }.background(Color.yellow).cornerRadius(10)
            }
            Spacer()
            Divider()
            HStack{
                Text("Total : 23213")
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("ADD TO CART")
                })
            }
            Divider()
            
        }

    }
}

#Preview {
    DetailProductView()
}
