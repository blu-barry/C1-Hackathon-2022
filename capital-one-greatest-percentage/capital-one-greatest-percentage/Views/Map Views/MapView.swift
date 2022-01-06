//
//  MapView.swift
//  capital-one-greatest-percentage
//
//  Created by Michael Barry on 1/5/22.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    /// MapView is the view that contains the pin locations etc for visualizing the proximity based establishment data (resturants, retail stores, etc)
    
    @StateObject private var viewModel = MapViewModel()
    //@State private var locationModel: LocationModel?
    @State var showStore: Bool = false
    @State private var showingPopover = false
    @State private var placesNearUserLocationFormat: [IdentifiablePlaceModel] = []
    
    @State private var cashbackLocations: [String] = ["Walgreens", "Wine Shop", "Macys", "Overstick", "JCPenny", "Expedia", "Grubhub", "Priceline", "Groupon", "Sephore", "Hotels.com", "Ulta", "HSN", "GAP", "GAP Factory", "J.Crew", "Vistaprint 8", "Anthropologie", "TireRack.com", "Belk", "Best Western", "Vitacost.com", "Michaels ", "Academny", "American Eagle", "Bloomingdales", "Lulus", "Quill.com", "Dyson", "Hotwire", "l.l.Bean", "Adidas", "Shop Disney", "J.Crew Factory", "Asos", "Saks Fifth Avenue", "Cheap Q Air", "Advance Auto Parts", "Madewell", "paramount+", "LTD Commodities", "Travelocity", "The Lakeside Collection", "Xfinity", "Orbitz ", "Newark", "Edible Arrangements", "Custom Ink"]
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true,
                        annotationItems: placesNearUserLocationFormat)
                    { place in
                        MapPin(coordinate: place.location,
                               tint: Color.purple)
                    }
                    .ignoresSafeArea()
                    .accentColor(Color(.systemPink))
                    .onAppear {
                        viewModel.checkLocationServiceStatus()
                    }
//            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
//                .ignoresSafeArea()
//                .accentColor(Color(.systemPink))
//                .onAppear {
//                    viewModel.checkLocationServiceStatus()
//                }
            
            // Search Bar
            VStack(spacing: 0) {
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
                                
                                Text(store.locationInfo.placemark.name ?? "")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading)
                                    .onTapGesture {
                                        //viewModel.selectStore(store: store)
                                        //viewModel.region = MKCoordinateRegion(center: store.storePlacemark.location!.coordinate, span: MapDetails.defaultSpan)
                                        
                                    }
                                
                                Divider()
                            }
                        }.padding(.top)
                        
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
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
