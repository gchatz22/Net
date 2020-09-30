//
//  Landmark.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 9/6/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import Foundation
import MapKit

struct Landmark{
    
    let placemark: MKPlacemark
    
    var id: UUID{
        return UUID()
    }
    
    var name: String{
        self.placemark.name ?? ""
    }
    
    var title: String {
        self.placemark.title ?? ""
    }
    
    var coordinate: CLLocationCoordinate2D{
        self.placemark.coordinate
    }
}
