//
//  StoreModel.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/6/22.
//

import SwiftUI
import MapKit

struct StoreModel: Identifiable {
    
    var id = UUID().uuidString
    var store: CLPlacemark
}
