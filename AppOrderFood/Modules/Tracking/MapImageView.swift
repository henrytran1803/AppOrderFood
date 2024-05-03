//
//  MapImageView.swift
//  AppOrderFood
//
//  Created by Tran Viet Anh on 29/04/2024.
//

import SwiftUI
import MapKit
struct MapImageView: View {
    let coordinate: CLLocationCoordinate2D
    let image: UIImage
    
    var body: some View {
        CustomMapView(coordinate: coordinate, image: image)
            .edgesIgnoringSafeArea(.all)
    }
}
