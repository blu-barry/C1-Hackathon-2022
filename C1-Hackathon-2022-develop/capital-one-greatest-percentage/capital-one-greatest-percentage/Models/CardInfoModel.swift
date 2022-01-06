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
    
    var distance: Double
    
    var theme: UIColor

}


extension PopupInfo {

    static let sampleData: [PopupInfo] =

    [

        PopupInfo(title: "Rite Aid", location: "16 Hollow Road", distance: 1.3, theme: .red),
        PopupInfo(title: "Rite Maid", location: "16 Hllow Road", distance: 1.3, theme: .magenta),
        PopupInfo(title: "Rite Maid", location: "16 Hllow Road", distance: 1.3, theme: .yellow)

    
    ]

}
