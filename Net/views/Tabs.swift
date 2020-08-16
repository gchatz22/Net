//
//  ContentView.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 8/10/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import SwiftUI

struct Tabs: View {
    @State private var selection = 1
 
    var body: some View {
        TabView(selection: $selection){
            Explore()
                .tabItem {
                    VStack {
                        Image("first")
                        Text("First")
                    }
                }
                .tag(0)
            
            Feed()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Second")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Tabs().previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
    }
}
