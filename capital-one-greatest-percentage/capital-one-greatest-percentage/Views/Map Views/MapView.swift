//
//  MapView.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/5/22.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapView: View {
    /// MapView is the view that contains the pin locations etc for visualizing the proximity based establishment data (resturants, retail stores, etc)
    //let locationManager = CLLocationManager()
    
    //locationManager.requestAlwaysAuthorization()
    //locationManager.requestWhenInUseAuthorization()
    @StateObject private var viewModel = MapViewModel()
    @State private var locationModel: LocationModel?
    
    @State private var showingPopover = false
    
    
    var body: some View {
        /*Button("Show Menu") {
                    showingPopover = true
                }
        .popover(isPresented: $showingPopover) {
                    Text("Your content here")
                        .font(.headline)
                        .padding()
                }*/
        //LocationPermission(userLocationManager: userLocationManager)
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkLocationServiceStatus()
            }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
