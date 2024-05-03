//
//  StoreKit.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 25/04/2024.
//

import SwiftUI
import StoreKit
struct StoreKit: View {
    var body: some View {
        VStack{
            Text("term")
        }.subscriptionStorePolicyDestination(for: .termsOfService){
            Text("term")
                
        }.subscriptionStorePolicyDestination(for: .privacyPolicy){
            Text("term")
                
        }
        .subscriptionStorePickerItemBackground(.thinMaterial)
        .storeButton(.visible, for: .cancellation)
    }
}

#Preview {
    StoreKit()
}
