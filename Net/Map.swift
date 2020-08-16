//
//  Map.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/10/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 29, longitude: 100), latitudinalMeters: 500, longitudinalMeters: 500)
    
    var body: some View {
        MapView(coordinateRegion: $region)
    }
}

struct Map_Previews: PreviewProvider {
    static var previews: some View {
        MapView().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}
