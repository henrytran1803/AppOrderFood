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
    
    @State var isOpenAddCate = false
    @State var isOpenDiscount = false
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
                    .frame(height: 170)
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
                        
                        NavigationLink(destination: OrderView()) {
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
                                let content = UNMutableNotificationContent()
                                content.title = "Tạm biệt."
                                content.subtitle = "Sớm gặp lại nhé."
                                content.sound = UNNotificationSound.default

                                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2, repeats: false)

                                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                                UNUserNotificationCenter.current().add(request)
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
        
            .fullScreenCover(isPresented: $isShowProfile, content: {
                ProfileView(isShowProfile: $isShowProfile)
            })
            .fullScreenCover(isPresented: $isLogout, content: {
                WelcomeView()
            })
            .fullScreenCover(isPresented: $isOpenDiscount, content: {
                DiscountAddView()
            })
            .fullScreenCover(isPresented: $isOpenAddCate, content: {
                CategoryView()
            })
            .onAppear {
                infoU.fetchUser()
            }
    }
}

#Preview {
    SettingView()
}
