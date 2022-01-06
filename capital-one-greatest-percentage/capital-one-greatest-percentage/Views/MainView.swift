//
//  MainView.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/6/22.
//

import SwiftUI

struct MainView: View {
    
    //@State var searchText: String
    
    var body: some View {
        NavigationView {
            ZStack {
                MapView()
                
                /*TextField("Type your search",text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())*/
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
}
