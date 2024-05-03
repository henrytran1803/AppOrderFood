//
//  ProfileView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 30/03/2024.
//

import SwiftUI
enum Flavor: String, CaseIterable, Identifiable {
    case edit, Info
    var id: Self { self }
}
struct ProfileView: View {
    @Binding var isShowProfile :Bool
    @State private var selectedFlavor: Flavor = .edit
    
    @State private var isLoading = false

    var body: some View {
        ScrollView{
            VStack {
                HStack{
                    Button(action: {isShowProfile = false}, label: {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.title)
                    })
                    Spacer()
                }.padding(.top, 50)
                    .padding(.leading, 20)
                RounderProfile()
                    .padding(.top, 60)
                    .padding()
                updateProfile()
                
                BottomInfoView()
            }
        }
        .background(Color(.bgproduct))
        .ignoresSafeArea()
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(isShowProfile: .constant(true))
    }
}
