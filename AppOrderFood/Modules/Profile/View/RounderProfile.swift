//
//  RounderProfile.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 30/03/2024.
//

import SwiftUI

struct RounderProfile: View {
     @ObservedObject var infoU  = InfoUser()
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
                        Text("\(infoU.user.lastName)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        Text("\(infoU.user.firstName)")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .bold()
                        Text("Email")
                            .font(.system(size: 13))
                        Text("\(infoU.user.email)")
                        Text("Date of birth")
                            .font(.system(size: 13))
                       // Text("\(infoU.user.dateOfBirth)")
                        Text("Address")
                            .font(.system(size: 13))
                        Text("\(infoU.user.address)")
                    }.foregroundColor(.secondary)
                }
            }
            .onAppear {
                infoU.fetchUser()
            }
    }
}

