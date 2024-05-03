//
//  HomeView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 28/03/2024.
//

import SwiftUI
import FirebaseAuth

struct HomeView: View {
    @State var searchText = ""
    @State var selectedCategory: CategoriesDetail?
    @ObservedObject var infoU  = InfoUser()
    @State var isLoading = false
    var body: some View {
        ZStack{
            
            VStack{
                HStack{
                    VStack(alignment: .leading) {
                        Text("Xin chào, \(infoU.user.firstName)")
                        Text("Chào mừng trở lại!")
                    }
                    Spacer()
                }.padding(.horizontal)
                TextField("", text: $searchText)
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                            Text("Tìm kiếm")
                            Spacer()
                        }.padding(.leading)
                            .padding(.horizontal, 16)
                            .foregroundColor(.gray)
                    )
                ListCategory(selectedCategory: $selectedCategory)
                HStack{
                    Text("Favorite")
                        .font(.title2)
                        .bold()
                        .padding()
                    Spacer()
                    
                }
                ListProduct(searchText: $searchText)
                
                
            }.padding(.top, 60)
            let orderur = UserDefaults.standard.string(forKey: "order")
            if orderur != "" {
                VStack{
                    TrackOrderView()
                    Spacer()
                }.padding(.top, 70)
            }
        }
            .onAppear {
                isLoading = true
                infoU.fetchUser()
                isLoading = false
                
                
            }
            .disabled(isLoading)
            .overlay(Group {
                if isLoading {
                    ProgressView()
                }
            })
        
    }

}

#Preview {
    HomeView()
}
