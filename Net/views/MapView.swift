//
//  Map.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/10/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
   
    let map = MKMapView()
    @State var alert = false // Use later so that a user gets alerted
                             // to allow access to location
    @State var landmarks: [Landmark]
    
    
    func makeCoordinator() -> LocPickerCoordinator {
        return Coordinator(par: self)
    }
    
    func makeUIView(context: Context) -> MKMapView{
        map.showsUserLocation = true
//        let center = CLLocationCoordinate2D(latitude: 37.918658, longitude: 23.733826)
//        let region = MKCoordinateRegion(center: center, latitudinalMeters: 2000, longitudinalMeters: 2000)
//        map.region = region
//        manager.requestWhenInUseAuthorization()
        map.delegate = context.coordinator
//        manager.startUpdatingLocation()
        print("MapView")
        print(map.region.span.latitudeDelta)
        print(map.region.span.longitudeDelta)
        
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        updateAnnotations(from: map)
    }
    
    func updateAnnotations(from mapView: MKMapView){
        map.removeAnnotations(map.annotations)
        let annotations = self.landmarks.map(LandmarkAnnotation.init)
        map.addAnnotations(annotations)
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
    }
}
