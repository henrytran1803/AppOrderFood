//
//  TrackingView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/04/2024.
//
import SwiftUI
import MapKit

struct TrackingView: View {
    @State var order: Oder
    @State var isShow = false
    @State var height: CGFloat = 0.7
    @State var height2: CGFloat = 0.1
    @State var back = false
    @State var isAdd = false
    @State private var orderID: String = ""
    @State private var orderLocation: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    @State private var locationUpdateTimer: Timer?
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        let screenHeight = screenSize.height
        ZStack{
            VStack{
                HStack{
                    Button(action: {back = true}, label: {
                        Text("Back")
                    })
                    Spacer()
                }
                if orderLocation.latitude == 0 && orderLocation.longitude == 0 {
                    ProgressView("Loading")
                } else {
                    MapImageView(coordinate: orderLocation,
                                 image: UIImage(named: "1")!)
                        .onReceive(locationUpdatePublisher) { _ in
                            startUpdatingLocation()
                        }
                }

                Button(action: {
                    isAdd = true
                    update()
                }, label: {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(isAdd ? .green : Color("bgproduct") )
                        .frame(width: isAdd ? .infinity : 200 , height:76)
                        .overlay{
                            HStack{
                                Image(systemName: isAdd ? "checkmark.seal.fill" :"cart.fill")
                                    .foregroundColor(isAdd ?.white :.green)
                                Text(isAdd ? "SUCCESS" :"Đã nhận được hàng")
                                    .foregroundColor(.white)
                                    .bold()
                                    .font(.system(size: 15))
                            }
                        }
                })
                Spacer()
            }
            Status(order: $order, height: $height2)
                .offset(y: isShow ? screenHeight * 0.35 : screenHeight * 0.56)
                .animation(
                    Animation.easeInOut(duration: 0.8)
                )
        }
        .onTapGesture {
            isShow.toggle()
            if isShow {
                height = 0.53
                height2 = 0.3
            } else {
                height = 0.7
                height2 = 0.1
            }
        }
        .fullScreenCover(isPresented: $back, content: {
            TabView()
        })
        .onAppear {
            if let savedOrderID = UserDefaults.standard.string(forKey: "order") {
                orderID = savedOrderID
            }
            startUpdatingLocation()
        }
        .onDisappear {
            locationUpdateTimer?.invalidate()
        }
    }
    
    private func startUpdatingLocation() {
        locationUpdateTimer?.invalidate()
        locationUpdateTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
            location()
        }
    }
    
    private func location() {
        OrderMV().getLocationForOrder(orderId: orderID) { location in
            DispatchQueue.main.async {
                if let location = location {
                    self.orderLocation = location
                    print(orderLocation)
                }
            }
        }
    }
    
    private func update() {
        OrderMV().update()
        UserDefaults.standard.set("", forKey: "order")
    }
    private var locationUpdatePublisher: Timer.TimerPublisher {
        Timer.publish(every: 5, on: .main, in: .common)
    }
}
