//
//  RounderProfile.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 30/03/2024.
//

import SwiftUI

struct RounderProfile: View {
    @State var user: User
    var body: some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .frame(width: 370, height: 300)
            .foregroundColor(.white)
            .overlay{
                HStack{
                    Image("imgFace")
                            .resizable()
                            .frame(width:  150)
                            .cornerRadius(25)
                            .padding()
                    Spacer()
                    VStack(alignment: .leading){
                        Text(user.lastName)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        Text(user.fistName)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        Text("Email")
                            .font(.system(size: 13))
                        Text(user.email)
                        Text("Date of birth")
                            .font(.system(size: 13))
                        Text("\(user.dateOfBirth.formatted(.dateTime.day().month().year()))")
                        Text("Address")
                            .font(.system(size: 13))
                        Text(user.address)
                    }.foregroundColor(.secondary)
                }
            }
    }
}

