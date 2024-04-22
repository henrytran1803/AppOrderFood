//
//  MapView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 05/04/2024.
//
import CoreLocation
import MapKit
import SwiftUI

struct MapView: View {
    @Binding var height: CGFloat
    let locationManager = CLLocationManager()
    @State private var placemark: CLPlacemark?
    @Binding var isAdd :Bool
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 37.334_900, longitude: -122.009_020),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        let screenSize = UIScreen.main.bounds.size
        let screenHeight = screenSize.height
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea(.all)
                .frame(height:screenHeight * height)
                .onAppear {
                    locationManager.requestWhenInUseAuthorization()
                    fetchPlacemark()
                }
            //            VStack(alignment: .leading){
            //                if let placemark = placemark {
            //                    Text("Địa chỉ: \(placemark.subThoroughfare ?? ""), \(placemark.thoroughfare ?? ""), \(placemark.locality ?? ""),  \(placemark.administrativeArea ?? ""), \(placemark.country ?? "")")
            //                        .foregroundStyle(.secondary)
            //                    Text("Mã bưu điện: \(placemark.postalCode ?? "")")
            //                        .foregroundStyle(.secondary)
            //                } else {
            //                    Text("Lấy thông tin địa điểm...")
            //                }
            //            }
            Button(action: {isAdd = true
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
        }
    }
    
    private func fetchPlacemark() {
        guard let location = locationManager.location else { return }
        
        CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
            guard let placemark = placemarks?.first, error == nil else { return }
            DispatchQueue.main.async {
                self.placemark = placemark
            }
        }
    }
    func update(){
            OrderMV().update()
            UserDefaults.standard.set("", forKey: "order")
        sleep(2)
    }
}

//struct MapView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapView(height: .constant(300))
//    }
//}
