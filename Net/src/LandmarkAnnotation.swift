//
//  LandmarkAnnotation.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 9/6/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import Foundation
import MapKit

class LandmarkAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(landmark: Landmark){
        self.title = landmark.name
        self.coordinate = landmark.coordinate
    }
}
