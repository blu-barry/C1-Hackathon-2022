//
//  MapViewModel.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/5/22.
//
import SwiftUI
import MapKit

enum MapDetails {
    static let defaultLocation = CLLocationCoordinate2D(latitude: 38.9259, longitude: -77.2120)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.defaultLocation, span: MapDetails.defaultSpan)
    @Published var mapSearchText = ""
    // Searched Stores
    @Published var stores : [StoreModel] = []
    @Published var placesNearUser = []
    @Published var placesNearUserLocationFormat: [IdentifiablePlaceModel] = []
    var locationManager: CLLocationManager?
    
    
    func generateCashbackDict(names: [String]) -> [String: CashbackDataModel] {
        var cbDict: [String: CashbackDataModel] = [:]
        for name in names {
            cbDict[name] = CashbackDataModel(locationName: name, /* Placeholder percentage*/ locationPercentage: 1.5)
        }
        return cbDict
    }
    
    func checkLocationServiceStatus() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self    // setting location manager delegate
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            // add additional location manager functionality
        } else {
            print("Location permissions need to be turned on")
        }
    }
    
    private func checkLocationAuthorizationStatus() {
        guard let locationManager = locationManager else { return } // already resolved location service status errors so don't have to check again
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Restricted Location")
        case .denied:
            print("Location Permissions Not Enabled")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorizationStatus()  // Monitors Location Authorization Status
    }
    
    // search nearby places
    
    func searchQueryNearby() {
        
        //stores.removeAll()
        self.placesNearUserLocationFormat.removeAll()
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = mapSearchText
        
        // Fetch
        var places: [IdentifiablePlaceModel] = []
        MKLocalSearch(request: request).start { (response, _) in
            
            guard let result = response else { return }
            //var places: [MKMapItem] = []
            self.placesNearUser = result.mapItems.compactMap({ (item) -> MKMapItem in
                places.append(IdentifiablePlaceModel(location: item.placemark.coordinate))
                return item
            })
            self.placesNearUserLocationFormat = places
        }
        print(self.placesNearUser)
    }
    
    // Selecting search result
    /*
    func selectStore(store: StoreModel) {
        
        // Showing pin on map
        
        var searchText = ""
        guard let coordinate = store.locationInfo.placemark.coordinate else { return }
        
        let storeAnnotation = MKPointAnnotation()
        storeAnnotation.coordinate = coordinate
        storeAnnotation.title = store.locationInfo.name ?? "No Name"
        
        // Removing Old Pins?
    }
     */
}
