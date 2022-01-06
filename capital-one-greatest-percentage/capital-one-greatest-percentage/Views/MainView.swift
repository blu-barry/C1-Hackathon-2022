//
//  MainView.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/6/22.
//

import SwiftUI

struct MainView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            NavigationView {
                List {
                    NavigationLink(destination: MapView()) {
                        Text("Rewards")
                    }.navigationTitle("Capital One")
                    Text("test")
                 }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
