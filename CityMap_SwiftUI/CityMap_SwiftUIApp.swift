//
//  CityMap_SwiftUIApp.swift
//  CityMap_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-17.
//

import SwiftUI

@main
struct CityMap_SwiftUIApp: App {
    
    @StateObject private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(viewModel)
        }
    }
}
