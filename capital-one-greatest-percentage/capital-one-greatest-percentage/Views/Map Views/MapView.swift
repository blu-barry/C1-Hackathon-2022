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
    //let locationManager = CLLocationManager()
    
    //locationManager.requestAlwaysAuthorization()
    //locationManager.requestWhenInUseAuthorization()
    @StateObject private var viewModel = MapViewModel()
    @State private var locationModel: LocationModel?
    
    @State private var showingPopover = false
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear {
                    viewModel.checkLocationServiceStatus()
                }
            
                
                
            VStack {
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
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
