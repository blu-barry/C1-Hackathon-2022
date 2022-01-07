//
//  CashbackDataModel.swift
//  capital-one-greatest-percentage
//
//  Created by Vatsal Baherwani on 1/6/22.
//

import Foundation

struct CashbackDataModel {
    init(locationName: String, locationPercentage: Double) {
        name = locationName
        cashbackPercentage = locationPercentage
    }
    
    var name: String
    var cashbackPercentage: Double
}
