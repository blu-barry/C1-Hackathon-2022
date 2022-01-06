//
//  StoreModel.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/6/22.
//

import SwiftUI
import MapKit

struct StoreModel: Identifiable {
    
    //var id = UUID().uuidString?
    let id: UUID
    var locationInfo: MKMapItem
    let location2D: CLLocationCoordinate2D
    
    init(id: UUID = UUID(), locationInfo: MKMapItem) {
        self.id = id
        self.locationInfo = locationInfo
        self.location2D = locationInfo.placemark.coordinate
    }
    
}
//
//struct IdentifiablePlaceModel: Identifiable {
//    let id: UUID
//    let location: CLLocationCoordinate2D
//    init(id: UUID = UUID(), lat: Double, long: Double) {
//        self.id = id
//        self.location = CLLocationCoordinate2D(
//            latitude: lat,
//            longitude: long)
//    }
//}
