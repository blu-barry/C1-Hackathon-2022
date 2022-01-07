//
//  MapView.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/5/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    let name: String
    let cashBackPercentage: String
    var show: Bool = false
    init(id: UUID = UUID(), lat: Double, long: Double, name: String, cashBackPercentage: String) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
        self.name = name
        self.cashBackPercentage = cashBackPercentage
    }
}

struct PinAnnotationMapView: View {
    let place: IdentifiablePlace
    @State var region: MKCoordinateRegion

    var body: some View {
        Map(coordinateRegion: $region,
            annotationItems: [place])
        { place in
            MapPin(coordinate: place.location,
                   tint: .red)
        }
    }
}
struct MapView: View {
    /// MapView is the view that contains the pin locations etc for visualizing the proximity based establishment data (resturants, retail stores, etc)
    //let locationManager = CLLocationManager()
    
    //locationManager.requestAlwaysAuthorization()
    //locationManager.requestWhenInUseAuthorization()
    @State var hardCodedCapOneOfferStores = [IdentifiablePlace(lat: 37.78690641, long: -122.40665000, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.67396012, long: -122.47090529, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.92776483, long: -122.51355920, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.70045284, long: -122.12485898, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 38.00457992, long: -122.54292044, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.53764369, long: -122.29969949, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.65012503, long: -122.10427549, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.65008736, long: -122.10425883, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.89466514, long: -122.05741471, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.96775698, long: -122.06134444, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.60536190, long: -122.03958890, name: "Macy's", cashBackPercentage: "6%"),
                                             IdentifiablePlace(lat: 37.69500524, long: -121.92966697, name: "Macy's", cashBackPercentage: "6%")]
    
    @StateObject private var viewModel = MapViewModel()
    @State private var locationModel: LocationModel?
    @State private var showingPopover = false
    
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true,
                annotationItems: hardCodedCapOneOfferStores)
            { place in
                MapAnnotation(
                        coordinate: place.location,
                        anchorPoint: CGPoint(x: 0.5, y: 0.7)
                    ) {
                    VStack{
                        if place.show {
                            Text("Test")
                        }
                        Image(systemName: "mappin.circle.fill")
                            .font(.title)
                            .foregroundColor(.red)
                            .onTapGesture {
                                let index: Int = hardCodedCapOneOfferStores.firstIndex(where: {$0.id == place.id})!
                                hardCodedCapOneOfferStores[index].show.toggle()
                            }
                        }
                    }
            }
            .ignoresSafeArea()
            .accentColor(Color(.systemBlue))
            .onAppear {
                viewModel.checkLocationServiceStatus()
            }
//            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
//                .ignoresSafeArea()
//                .accentColor(Color(.systemPink))
//                .onAppear {
//                    viewModel.checkLocationServiceStatus()
//                }
            
                
                
            VStack() {
                HStack {
                    Image(systemName: "🔍")
                        .foregroundColor(.gray)
                    TextField("Search", text: $viewModel.mapSearchText)
                }
                .padding(.vertical, 15)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                
                if !viewModel.stores.isEmpty && viewModel.mapSearchText != "" {
                    
                    ScrollView {
                        
                        VStack(spacing: 15) {
                            
                            ForEach(viewModel.stores){store in
                                
                                
                                Text(store.store.name ?? "")
                                Text(store.store.thoroughfare ?? "")
                                //Text(store.store.subThoroughfare ?? "")
                                Text(store.store.postalCode ?? "")
                                //Text(store.store.location ?? "")
                                Text(store.store.description ?? "")
                                //Text(store.store.region ?? "")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Divider()
                            }
                        }
                        
                    }
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
                    
                    
                }
                Spacer()
                
            }.padding()
            
        }
        .onChange(of: viewModel.mapSearchText, perform: { newValue in
            // searching nearby places
            // can add filters here later for cap one dicount places or pin them differently
            
            let delay = 0.3
        
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                
                if newValue == viewModel.mapSearchText {
                    // search
                    self.viewModel.searchQueryNearby()
                }
            }
        })
    }
    
    func getCSVData() -> Array<String> {
        do {
            let content = try String(contentsOfFile: "./CapitalOneCashBackOffers.csv")
            let parsedCSV: [String] = content.components(
                separatedBy: "\n"
            ).map{ $0.components(separatedBy: ",")[0] }
            return parsedCSV
        }
        catch {
            return []
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
