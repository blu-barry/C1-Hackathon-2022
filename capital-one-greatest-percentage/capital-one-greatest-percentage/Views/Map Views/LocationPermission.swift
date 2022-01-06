//
//  LocationPermission.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/5/22.
//

import SwiftUI

struct LocationPermission: View {
    @ObservedObject var userLocationManager: UserLocationManager
    
    var body: some View {
            
            switch userLocationManager.authorizationStatus {
            case .notDetermined:
                AnyView(RequestLocation())
                    .environmentObject(userLocationManager)
            case .restricted:
                Text("implement me")
                //ErrorView(errorText: "Location use is restricted.")
            case .denied:
                Text("implement me")
                //(ErrorView(errorText: "The app does not have location permissions. Please enable them in settings."))
            case .authorizedAlways, .authorizedWhenInUse:
                Text("implement me")
                //TrackingView()
                 //   .environmentObject(userLocationManager)
            default:
                Text("Unexpected status")
            }
        Text("Location Permissions View")
    }
}

struct RequestLocation: View {
    var body: some View {
        Text("RequestLocation - Implement Me")
    }
}

struct LocationPermission_Previews: PreviewProvider {
    static var previews: some View {
        LocationPermission(userLocationManager: UserLocationManager())
    }
}


