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
    
    @State var manager = CLLocationManager()
    @State var alert = false
    
    var body: some View {
        
        MapView(manager: $manager, alert: $alert)
            .edgesIgnoringSafeArea(.top)
            .alert(isPresented: $alert){
                Alert(title: Text("Please enable location access!"))
            }
        
    }
}

struct Explore_Previews: PreviewProvider {
    static var previews: some View {
        Explore().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}
