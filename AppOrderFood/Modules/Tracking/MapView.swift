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
    
    let locationManager = CLLocationManager()
    @State private var placemark: CLPlacemark?
    
    @State var region = MKCoordinateRegion(
        center: .init(latitude: 37.334_900,longitude: -122.009_020),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                locationManager.requestWhenInUseAuthorization()
            }.frame( height: 400)
        let latitude = locationManager.location?.coordinate.latitude
        let longitude = locationManager.location?.coordinate.longitude
       
        Text("\(latitude), \(longitude)")
        if let placemark = placemark {
                      Text("\(placemark.country ?? ""), \(placemark.locality ?? ""), \(placemark.thoroughfare ?? "")")
                          .padding()
                  }        
    }
    private func fetchPlacemark() {
         guard let location = locationManager.location else { return }
         
         CLGeocoder().reverseGeocodeLocation(location) { placemarks, error in
             guard let placemark = placemarks?.first else { return }
             self.placemark = placemark
         }
     }
}

#Preview {
    MapView()
}
