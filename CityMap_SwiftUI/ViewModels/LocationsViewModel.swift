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
        withAnimation(.easeInOut) {
            showLocationList.toggle()
        }
    }
    
    func showNextLoction(getLocation: Location) {
        withAnimation(.easeInOut) {
            mapLocation = getLocation
            showLocationList = false
        }
    }
    
    func nextButtonPressed() {
        // Getting the current location index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else { return }
        
        // Check if the current location is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is not valid restart from 0 index
            guard let firstLocation = locations.first else { return }
            showNextLoction(getLocation: firstLocation)
            return
        }
        
        // If next index is valid
        let nextLocation = locations[nextIndex]
        showNextLoction(getLocation: nextLocation)
    }
    
}
