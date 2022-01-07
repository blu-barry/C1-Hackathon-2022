//
//  PopupView.swift
//  capital-one-greatest-percentage
//
//  Created by Benjamin Bigdelle on 1/6/22.
//
import SwiftUI
import MapKit


struct PopUpView: View {

    let scrum: IdentifiablePlace
    let userLocation: CLLocationCoordinate2D

    var body: some View {

        VStack(alignment: .leading) {
            Text(scrum.name)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            HStack {
                var point = CLLocation(latitude: scrum.location.latitude, longitude: scrum.location.longitude)
                var usrLoc = CLLocation(latitude: userLocation.latitude, longitude: userLocation.longitude)
                let distanceInMeters = point.distance(from: usrLoc)
                
                if(distanceInMeters <= 1609) {
                    // under 1 mile
                    var distanceStr = "Less than a mile"
                    Label("Distance: \(distanceStr) mi", systemImage: "search")
                        .accessibilityLabel("\(distanceStr) distance")

                } else {
                    // out of 1 mile
                    var distanceStr = distanceInMeters/1609
                    Label("Distance: \(distanceStr) mi", systemImage: "search")
                        .accessibilityLabel("\(distanceStr) distance")
                }

                Spacer()

            }.font(.caption)
            Spacer()
        }.padding()

    }

}


struct PopUpView_Previews: PreviewProvider {

    //static var scrum = IdentifiablePlace()

    static var previews: some View {

        PopUpView(scrum: IdentifiablePlace(lat: 37.3346, long: -122.0090, name: "Apple Park", cashBackPercentage: "0"), userLocation: CLLocationCoordinate2D(latitude: 37.3346, longitude: -122.0090))

    }

}
