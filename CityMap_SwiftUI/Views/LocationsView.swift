//
//  LocationsView.swift
//  CityMap_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-17.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $viewModel.mapRegion)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}
