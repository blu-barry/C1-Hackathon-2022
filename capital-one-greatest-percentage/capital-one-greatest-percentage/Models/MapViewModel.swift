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
    
    var locationManager: CLLocationManager?
    
    static var cashbackDict: [String: CashbackDataModel] = {
        var cbDict: [String: CashbackDataModel] = [:]
        
        if var path = Bundle.main.path(forResource: "offers", ofType: "csv") {
            do {
                var data = try Data(contentsOf: URL(fileURLWithPath: path))
                let dataStr = String(decoding: data, as: UTF8.self)
                let dataLines = dataStr.components(separatedBy: .newlines)
                
                for i in 1...dataLines.count-1 {
                    let split = dataLines[i].components(separatedBy: ",")
                    if split.count > 1 {
                        var name = split[0].components(separatedBy: .whitespaces).joined().lowercased()
                        cbDict[name] = CashbackDataModel(locationName: name, locationPercentage: Int(split[1]) ?? 0)
                    }
                }
            } catch {
                print("Unexpected error when loading file: \(error).")
            }
        }
        
        return cbDict
    }()
    
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
        
        stores.removeAll()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = mapSearchText
        
        // Fetch
        
        MKLocalSearch(request: request).start { (response, _) in
            
            guard let result = response else { return }
            
            self.stores = result.mapItems.compactMap({ (item) -> StoreModel? in
                return StoreModel(store: item.placemark)
            })
        }
    }
}
