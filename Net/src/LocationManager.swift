//
//  LocationManager.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/29/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import Foundation
import MapKit

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject{
    
    private let manager = CLLocationManager()
    @Published var location: CLLocation? = nil
    
    override init(){
        super.init()
        self.manager.delegate = self
        self.manager.desiredAccuracy = kCLLocationAccuracyBest
        self.manager.distanceFilter = kCLDistanceFilterNone
        self.manager.requestWhenInUseAuthorization()
        self.manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        guard let location = locations.last else {
            return
        }
//        print(location)
        self.location = location
    }
    
    //    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){

    //        if status == .denied{
    //            parent.alert.toggle()
    //        }
    //    }
    
    //    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
    //
    //        let location = locations.last
    //        let point = MKPointAnnotation()
    //
    //        let georeader = CLGeocoder()
    //        georeader.reverseGeocodeLocation(location!) { (places, err) in
    //
    //            if err != nil{
    //                print((err?.localizedDescription)!)
    //            }
    //
    //            let place = places?.first?.locality
    //            point.title = place
    //            point.subtitle = "Current"
    //            point.coordinate = location!.coordinate
    //            self.parent.map.removeAnnotations(self.parent.map.annotations)
    //            self.parent.map.addAnnotation(point)
    //
    //            let region = MKCoordinateRegion(center: location!.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
    //            self.parent.map.region = region
    //
    //        }
    //    }
}
