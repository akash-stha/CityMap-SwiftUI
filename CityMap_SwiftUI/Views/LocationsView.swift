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
                .ignoresSafeArea()
            VStack(spacing: 0) {
                header
                    .padding()
                Spacer()
                locationPreviewCard
            }
        }
    }
}


#Preview {
    LocationsView()
        .environmentObject(LocationsViewModel())
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button {
                viewModel.toggleLocationsList()
            } label: {
                Text(viewModel.mapLocation.name + ", " + viewModel.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.primary)
//                    .animation(.none, value: viewModel.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: viewModel.showLocationList ? 0 : -180))
                    }
            }
            
            if viewModel.showLocationList {
                LocationsListView()
            }
            
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var locationPreviewCard: some View {
        ZStack {
            ForEach(viewModel.locations) { location in
                if viewModel.mapLocation == location {
                    LocationsPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .padding(.bottom, 15)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
}
