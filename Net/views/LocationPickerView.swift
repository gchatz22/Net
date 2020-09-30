//
//  LocationPickerView.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 9/5/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI
import MapKit

struct LocationPickerView: View {
    
    @State private var query: String = ""
    @State private var arrPlaces: [MKMapItem] = []
    @State private var selectedPicker = 0
    
    @ObservedObject private var locationManager = LocationManager()
    @State private var landmarks: [Landmark] = [Landmark]()
    
    var body: some View {
        
        let myCoords = locationManager.location == nil ? CLLocationCoordinate2D() : locationManager.location!.coordinate
        let map = MapView(landmarks: [])
        
        return VStack{
            
            SearchBar(text: $query, onEditingChanged: {_ in
                self.getNearbyPlaces(coords: myCoords, map: map)
            })
            
            Picker(selection: $selectedPicker, label: Text("")){
                Text("Text View").tag(0)
                Text("Map View").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            Spacer()
            
            if selectedPicker == 0{
                if arrPlaces.count==0{
                    Text("Pick a place or choose a custom one")
                    Spacer()
                } else {
                    List(arrPlaces, id: \.self) { place in
                        Text((place as MKMapItem).name!)
                    }
                }
            } else {
                map
            }
        }
        .navigationBarTitle("Add Location", displayMode: .inline)
        .padding(5)
    }
    
    func getNearbyPlaces(coords: CLLocationCoordinate2D, map: MapView){
        // Plan: Use the apple framework for stores and registered places and then custom location form for custom places
        
        if query.isEmpty{
            arrPlaces = []
        }
        
        let request = MKLocalSearch.Request()
        let region = MKCoordinateRegion(center: coords, span: MKCoordinateSpan(latitudeDelta: 111*0.001, longitudeDelta: 111*0.001))
        
        request.region = region
        request.naturalLanguageQuery = query
        
        let search = MKLocalSearch(request: request)
        
        search.start { (response, error) in
            if let response = response{
                self.arrPlaces  = response.mapItems
                self.landmarks = response.mapItems.map{
                    Landmark(placemark: $0.placemark)
                }
                print(self.landmarks)
            } else {
                print(error!)
            }
        }
    }
}

struct LocationPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LocationPickerView()
    }
}
