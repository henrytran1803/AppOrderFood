//
//  SettingView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 09/04/2024.
//

import SwiftUI
import TipKit
import FirebaseAuth

struct StatusTip: Tip {
    var title: Text {
        Text("Trạng thái")
    }


    var message: Text? {
        Text("Đây là trạng thái các đơn hàng của bạn.")
    }


    var image: Image? {
        Image(systemName: "questionmark.circle")
    }
}
struct SettingView: View {
    @State var isShowProfile = false
    @State var isLogout = false
    var statusTip = StatusTip()
    @ObservedObject var infoU  = InfoUser()
    @Environment(\.openURL) var openURL
    private var deepLinkService = DeepLinkService()
    var body: some View {
        NavigationStack{
            VStack{
                Image("bgimgprofile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .overlay{
                        HStack {
                            Circle()
                                .frame(height: 100)
                                .background(
                                    AsyncImage(url: Auth.auth().currentUser?.photoURL)
                                )
                            VStack(alignment: .leading) {
                                Text("tên: \(infoU.user.firstName)")
                                    Text("Họ: \(infoU.user.lastName)")
                                    Text("Email: \(infoU.user.email)")
                                
                            }
                            .padding()
                            .font(.body)
                            Spacer()
                        }
                        .padding()
                    }
                List {
                    
                    Section(header: Text("Trạng thái")){
                        TipView(statusTip, arrowEdge: .bottom)
                        HStack{
                            VStack{
                                Image(systemName: "person.crop.circle.badge.checkmark")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 30))
                                Text("3")
                                    .foregroundStyle(.red)
                            }
                            
                            Spacer()
                            VStack{
                                Image(systemName: "archivebox.circle")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 30))
                                Text("3")
                                    .foregroundStyle(.red)
                            }
                            Spacer()
                            VStack{
                                Image(systemName: "truck.box.badge.clock")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 30))
                                Text("3")
                                    .foregroundStyle(.red)
                            }
                            Spacer()
                            VStack{
                                Image(systemName: "star")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 30))
                                Text("3")
                                    .foregroundStyle(.red)
                            }
                        }
                    }
                    
                    Section(header: Text("Tài khoản")){
                        Button {
                                isShowProfile = true
                        } label: {
                            Text("Tài khoản")
                        }.foregroundColor(.black)
                        
                        Button {
                            
                        } label: {
                            Text("Lịch sử đơn hàng")
                        }.foregroundColor(.black)
                        
                    }
                    Section(header: Text("Hỗ trợ")){
                        Button {
                            deepLinkService.openURL(type: .email("tranvietanh1803@gmail.com"), openURLAction: openURL)
                        } label: {
                            Text("Email hỗ trợ")
                        }.foregroundColor(.black)
                        Button {
                            deepLinkService.openURL(type: .phone("0365899252"), openURLAction: openURL)
                        } label: {
                            Text("Liên Hệ trực tiếp")
                        }.foregroundColor(.black)
                        
                    }
                    
                    Section(header: Text("Ứng dụng")){
                        Button {
                            do {
                                try Auth.auth().signOut()
                                UserDefaults.standard.set(false, forKey: "isLogin")
                                isLogout = true
                            } catch let signOutError as NSError {
                                print("Error signing out: \(signOutError.localizedDescription)")
                            }
                        } label: {
                            Text("Đăng xuất")
                                .foregroundStyle(.red)
                        }
                        
                    }
                }
            }
           
        }.ignoresSafeArea()
            .task {
                try? Tips.configure([
                    .displayFrequency(.immediate),
                    .datastoreLocation(.applicationDefault)
                ])
  
            }
        //NavigationLink("Hello", destination: ProfileView(), isActive: $isShowProfile)
        
            .fullScreenCover(isPresented: $isShowProfile, content: {
                ProfileView(isShowProfile: $isShowProfile)
                //updateProfile()
            })
            .fullScreenCover(isPresented: $isLogout, content: {
                WelcomeView()
            })
            .onAppear {
                // Load user data when the view appears
                infoU.fetchUser()
            }
    }
}

#Preview {
    SettingView()
}
