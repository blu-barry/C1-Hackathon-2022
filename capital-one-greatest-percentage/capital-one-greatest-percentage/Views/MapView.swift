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
    //let locationManager = CLLocationManager()
    
    //locationManager.requestAlwaysAuthorization()
    //locationManager.requestWhenInUseAuthorization()
    
    @State private var locationModel: LocationModel?
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 38.9259, longitude: -77.2120), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        Map(coordinateRegion: $region)
            .ignoresSafeArea()
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
