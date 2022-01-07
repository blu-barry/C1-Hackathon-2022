//
//  PopupView.swift
//  capital-one-greatest-percentage
//
//  Created by Benjamin Bigdelle on 1/6/22.
//
import SwiftUI


struct SearchStackView: View {

    let scrum: PopupInfo

    var body: some View {

        VStack(alignment: .leading) {

            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)

            Spacer()

            HStack {

                Label("Distance: \(scrum.distance) mi", systemImage: "search")
                    .accessibilityLabel("\(scrum.distance) distance")

                Spacer()

                Label("\(scrum.location)", systemImage: "location")
                    .accessibilityLabel("\(scrum.location) location")

                    .padding(.trailing, 20)

            }

            .font(.caption)

        }

        .padding()
        

        .foregroundColor(Color.black)
        .listRowBackground(Color(scrum.theme))

    }

}


struct CardView_Previews: PreviewProvider {

    static var scrum = PopupInfo.sampleData[2]

    static var previews: some View {

        SearchStackView(scrum: scrum)

            .background(Color(scrum.theme))

            .previewLayout(.fixed(width: 400, height: 150))

    }

}
