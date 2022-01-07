//
//  CardInfoModel.swift
//  capital-one-greatest-percentage
//
//  Created by Benjamin Bigdelle on 1/6/22.
//

import Foundation
import UIKit

struct PopupInfo {

    var title: String

    var location: String
    
    var distance: Int
    
    var theme: UIColor

}


extension PopupInfo {

    static let sampleData: [PopupInfo] =

    [

        PopupInfo(title: "Rite Aid", location: "37th Street", distance: 3, theme: .white),
        PopupInfo(title: "Walgreens", location: "5th Ave", distance: 5, theme: .white),
        PopupInfo(title: "Walmart", location: "Village", distance: 7, theme: .white),
        

    
    ]

}
