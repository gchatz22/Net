//
//  Location.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/22/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import Foundation
import MapKit


class Location: NSObject, NSSecureCoding, Codable{
    
    static var supportsSecureCoding: Bool = true
    
    let latitude: Double
    let longitude: Double
    
    init(latitude: Double, longitude: Double){
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func locationCoordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(latitude, forKey: "latitude")
        coder.encode(longitude, forKey: "longitude")
    }
    
    required convenience init?(coder: NSCoder) {
        let latitude = coder.decodeDouble(forKey: "latitude")
        let longitude = coder.decodeDouble(forKey: "longitude")
        self.init(latitude: latitude, longitude: longitude)
    }
    
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}
