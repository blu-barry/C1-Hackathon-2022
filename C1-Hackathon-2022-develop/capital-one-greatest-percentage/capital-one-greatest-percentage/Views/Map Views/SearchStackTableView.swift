//
//  PopupTableView.swift
//  capital-one-greatest-percentage
//
//  Created by Benjamin Bigdelle on 1/6/22.
//

import SwiftUI

struct SearchStackTableView: View {
    let scrums: [PopupInfo]

    
        var body: some View {

            List {

                ForEach(scrums, id: \.title) { scrum in SearchStackView(scrum: scrum)
                        

                }

            }

        }

    }

struct PopupTableView_Previews: PreviewProvider {
    static var previews: some View {

        SearchStackTableView(scrums: PopupInfo.sampleData)

    }
}
