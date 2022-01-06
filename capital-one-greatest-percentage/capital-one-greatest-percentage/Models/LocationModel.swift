//
//  LocationModel.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/5/22.
//

import Foundation

struct LocationModel {
    /// General ata model for a pin or users location
    var latitude_coor: Double
    var longitude_coor: Double
    var latitudeDeltaZoom: Double
    var longitudeDeltaZoom: Double
    
    init(latitude_coor: Double? = 38.9259, longitude_coor: Double? = -77.2120, latitudeDeltaZoom: Double? = 0.1, longitudeDeltaZoom: Double? = 0.1) {
        self.latitude_coor = latitude_coor!
        self.longitude_coor = latitude_coor!
        self.latitudeDeltaZoom = latitude_coor!
        self.longitudeDeltaZoom = latitude_coor!
    }
}
