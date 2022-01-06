//
//  MainView.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/6/22.
//

import SwiftUI

struct MainView: View {
    
    @State private var search: String = ""
    
    var body: some View {
        MapView()
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}

//ZStack(alignment: .top) {
//
//    MapView()
//
//    TextField("Search", text: $search, onEditingChanged: { _ in }) {
//        //commit
//    }.textFieldStyle(RoundedBorderTextFieldStyle())
//        .padding()
//        .offset(y: 44)
//}
