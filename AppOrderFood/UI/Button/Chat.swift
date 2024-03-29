//
//  Chat.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 06/03/2024.
//

import SwiftUI
//import SplineRuntime
struct Chat: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Chat()
}


struct header: View {
    var body: some View {
        // fetching from cloud
        let url = URL(string: "https://build.spline.design/BW3iexN6M43cPADV0Jap/scene.splineswift")!

        

        //try? SplineView(sceneFileURL: url).ignoresSafeArea(.all)
    }
}
