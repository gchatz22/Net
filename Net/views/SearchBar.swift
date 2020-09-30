//
//  SearchBar.swift
//  Net
//
//  Created by Giannis Chatziveroglou on 9/6/20.
//  Copyright © 2020 Giannis Chatziveroglou. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var onEditingChanged: (Bool) -> Void = {_ in }

    class Coordinator: NSObject, UISearchBarDelegate {
        
        var parent: SearchBar

        init(parent1: SearchBar) {
            parent = parent1
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.parent.text = searchText
            self.parent.onEditingChanged(true)
        }
        
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(parent1: self)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}
