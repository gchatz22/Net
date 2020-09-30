//
//  Coordinator.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/29/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import Foundation
import MapKit

class LocPickerCoordinator: NSObject, MKMapViewDelegate{
    
    var control: MapView

    init(par: MapView){
        control = par
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]){
        if let annotationView = views.first{
            if let annotation = annotationView.annotation{
                if annotation is MKUserLocation{
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: Backend.defaultLatMeters, longitudinalMeters: Backend.defaultLonMeters)
                                                
                    mapView.setRegion(region, animated: true)
                }
            }
        }
    }

}
