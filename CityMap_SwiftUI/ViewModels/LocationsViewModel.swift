//
//  LocationsViewModel.swift
//  CityMap_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-17.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject {
    // All loaded locations
    @Published var locations: [Location]
    
    // Current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // Current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(
        latitudeDelta: 0.1,
        longitudeDelta: 0.1
    )
    
    // Show list of locations
    @Published var showLocationList: Bool = false
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: mapLocation)
    }

    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )

        }
    }
    
    func toggleLocationsList() {
        withAnimation(.bouncy) {
            showLocationList.toggle()
        }
    }
    
    func showNextLoction(getLocation: Location) {
        withAnimation(.easeInOut) {
            mapLocation = getLocation
            showLocationList = false
        }
    }
    
}
