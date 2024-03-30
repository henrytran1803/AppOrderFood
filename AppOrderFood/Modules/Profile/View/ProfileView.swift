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
    @State private var selectedFlavor: Flavor = .edit
    var body: some View {
        VStack{
            RounderProfile(user: MockUser.user)
                .padding(.top, 60)
                .padding()
            List {
                Picker("Flavor", selection: $selectedFlavor) {
                    Text("Sửa thông tin").tag(Flavor.edit)
                    Text("Xem tổng quan").tag(Flavor.Info)
                }.foregroundColor(Color(.bgproduct))
            }.pickerStyle(.segmented)

            BottomInfoView()
            
        } .background(Color(.bgproduct))
        .ignoresSafeArea()
           
    }
}

#Preview {
    ProfileView()
}

