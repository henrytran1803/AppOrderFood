//
//  DeleteAccountView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 06/03/2024.
//

import SwiftUI

struct DeleteAccountView: View {
    @State var userName = ""
    @State var passWord = ""
    @State var isConfirmDelete = false
    @State var isCorrectUser = false
    @State var isCorrectPassword = false
    var body: some View {
        VStack{
            Spacer()
            Text("Confirm to delete account")
                .font(.system(size: 30).bold())
            Spacer()
            VStack{
                Text("User name")
                    .font(.system(size: 15).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                TextField("",text: $userName)
                    .frame(height: 35)
                    .border(Color.black)
                    .padding(.horizontal)
            }.padding(.bottom)
            VStack{
                Text("User name")
                    .font(.system(size: 15).bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                TextField("",text: $passWord)
                    .frame(height: 35)
                    .border(Color.black)
                    .padding(.horizontal)
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                HStack{
                    Text("DELETE")
                    Image("trash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 25, alignment: .topLeading)
                }
                
            }).buttonStyle(PressEffectButtonStyle(backgroundColor: Color.red))
        }
    }
}

#Preview {
    DeleteAccountView()
}
