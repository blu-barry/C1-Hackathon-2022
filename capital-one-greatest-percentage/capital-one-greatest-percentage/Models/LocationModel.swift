//
//  LocationModel.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/5/22.
//

import MapKit

//struct LocationModel {
//    /// General ata model for a pin or users location
//
//    //var id = UUID().uuidString?
//    let id: UUID
//    var locationInfo: MKMapItem
//    let location2D: CLLocationCoordinate2D
//
//    init(id: UUID = UUID(), locationInfo: MKMapItem) {
//        self.id = id
//        self.locationInfo = locationInfo
//        self.location2D = locationInfo.placemark.coordinate
//    }
//
//}

struct IdentifiablePlaceModel: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), location: CLLocationCoordinate2D) {
        self.id = id
        self.location = location
    }
}
