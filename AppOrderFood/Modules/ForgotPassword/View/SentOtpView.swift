//
//  SentOtpView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 06/03/2024.
//

import SwiftUI
import Combine

struct SentOtpView: View {
    //MARK -> PROPERTIES

    enum FocusPin {
        case  pinOne, pinTwo, pinThree, pinFour
    }

    @FocusState private var pinFocusState : FocusPin?
    @State var pinOne: String = ""
    @State var pinTwo: String = ""
    @State var pinThree: String = ""
    @State var pinFour: String = ""
    @State var isReSent = false
    @State var isVerify = false
    var body: some View {
            VStack {
                Text("Verify your account")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("Enter 4 digit code we'll text you on Email, check your email create account.")
                    .font(.caption)
                    .fontWeight(.thin)
                    .padding(.top)
                Spacer()
                Image("otp")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 350, alignment: .topLeading)
                Spacer()
                HStack(spacing:15, content: {

                    TextField("", text: $pinOne)
                        .modifier(OtpModifer(pin:$pinOne))
                        .onChange(of:pinOne){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinTwo
                            }
                        }
                        .focused($pinFocusState, equals: .pinOne)
                        .border(Color.black)
                        .multilineTextAlignment(.leading)

                    TextField("", text:  $pinTwo)
                        .modifier(OtpModifer(pin:$pinTwo))
                        .onChange(of:pinTwo){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinThree
                            }else {
                                if (newVal.count == 0) {
                                    pinFocusState = .pinOne
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinTwo)
                        .border(Color.black)
                        .multilineTextAlignment(.leading)


                    TextField("", text:$pinThree)
                        .modifier(OtpModifer(pin:$pinThree))
                        .onChange(of:pinThree){newVal in
                            if (newVal.count == 1) {
                                pinFocusState = .pinFour
                            }else {
                                if (newVal.count == 0) {
                                    pinFocusState = .pinTwo
                                }
                            }
                        }
                        .focused($pinFocusState, equals: .pinThree)
                        .border(Color.black)
                        .multilineTextAlignment(.leading)

                    TextField("", text:$pinFour)
                        .modifier(OtpModifer(pin:$pinFour))
                        .onChange(of:pinFour){newVal in
                            if (newVal.count == 0) {
                                pinFocusState = .pinThree
                            }
                        }
                        .focused($pinFocusState, equals: .pinFour)
                        .border(Color.black)
                        .multilineTextAlignment(.leading)

                })
                .padding(.vertical)
                Spacer()
                Button(action: {}, label: {
                    Text("VERIFY")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                })
                .buttonStyle(PressEffectButtonStyle(backgroundColor: Color.green))
                HStack{
                    Text("Dont recive  an otp")
                        .font(.system(size: 15))
                    Button("resent"){
                        
                    }.font(.system(size: 15).bold())
                        .foregroundColor(/*@START_MENU_TOKEN@*/Color(red: 0.149, green: 0.388, blue: 0.588)/*@END_MENU_TOKEN@*/)
                }
            }

    }
}

#Preview {
    SentOtpView()
}
