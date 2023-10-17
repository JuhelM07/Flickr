//
//  ContentView.swift
//  Flickr
//
//  Created by Mohammad Miah on 16/10/2023.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @State var searchText = "Yorkshire"
    
    var body: some View {
        NavigationStack {
            ContentViewRow(searchText: searchText)
                .navigationTitle("Flickr")
        }
        .searchable(text: $searchText)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


