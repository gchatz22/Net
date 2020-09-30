//
//  Explore.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/13/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI
import MapKit

struct Explore: View {
    
    @State private var landmarks: [Landmark] = [Landmark]()
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        
//        let coordinate = self.locationManager.location == nil ? CLLocationCoordinate2D() : self.locationManager.location!.coordinate
        
        return ZStack{
            MapView(landmarks: [])
    //        LocationPicker()
                .edgesIgnoringSafeArea(.top)
//            Text("\(coordinate.latitude), \(coordinate.longitude)")
        }
//            .alert(isPresented: $alert){
//                Alert(title: Text("Please enable location access!"))
//            }
        
//        LocationMenu()
        
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}
