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
            mapLayerView
                .contentShape(Rectangle())
                .gesture(
                    viewModel.showLocationList ? TapGesture().onEnded {
                        viewModel.toggleLocationsList()
                    } : nil // Disable gesture if `showLocationList` is false
                )
            VStack(spacing: 0) {
                header
                    .frame(maxWidth: 600)
                Spacer()
                locationPreviewCard
            }
        }
        .fullScreenCover(item: $viewModel.sheetLocation, onDismiss: nil) { loaction in
            LocationDetailView(locations: loaction)
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
                            .rotationEffect(Angle(degrees: viewModel.showLocationList ? -180 : 0))
                    }
            }
            
            if viewModel.showLocationList {
                LocationsListView()
            }
            
        }
        .background(RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial))
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
        .padding()
    }
    
    private var locationPreviewCard: some View {
        ZStack {
            ForEach(viewModel.locations) { location in
                if viewModel.mapLocation == location {
                    LocationsPreviewView(location: location)
                        .shadow(color: .black.opacity(0.3), radius: 20)
                        .padding()
                        .padding(.bottom, 15)
                        .frame(maxWidth: 600)
                        .frame(maxWidth: .infinity)
                        .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                }
            }
        }
    }
    
    private var mapLayerView: some View {
        Map(coordinateRegion: $viewModel.mapRegion,
            annotationItems: viewModel.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(viewModel.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        viewModel.showNextLoction(getLocation: location)
                    }
            }
        })
        .ignoresSafeArea()
    }
}
