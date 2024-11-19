//
//  LocationDetailView.swift
//  CityMap_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-19.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @EnvironmentObject private var viewModel: LocationsViewModel
    @Environment(\.colorScheme) private var colorScheme
    private let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
    @State private var currentIndex: Int = 0

    let locations: Location
    
    var body: some View {
        ScrollView {
            VStack {
                headerImage
                VStack(alignment: .leading) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayerView
                        .aspectRatio(1, contentMode: .fit)
                        .clipShape(.rect(cornerRadius: 10))
                        .allowsHitTesting(false)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topTrailing) {
            closeButton
        }
    }
}

#Preview {
    LocationDetailView(locations: LocationsDataService.locations.first!)
        .environmentObject(LocationsViewModel())
}

extension LocationDetailView {
    
    private var headerImage: some View {
        TabView(selection: $currentIndex) {
            ForEach(Array(locations.imageNames.enumerated()), id: \.offset) { index, imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
                    .tag(index) // Using the loop index as the tag
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
        .onReceive(timer) { _ in
            withAnimation {
                currentIndex = (currentIndex + 1) % locations.imageNames.count
            }
        }
    }
    
    
    private var titleSection: some View {
        VStack(alignment: .leading) {
            Text(locations.name)
                .font(.largeTitle.weight(.semibold))
            Text(locations.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading) {
            Text(locations.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            
            if let url = URL(string: locations.link) {
                Link("Read More", destination: url)
                    .font(.footnote)
                    .tint(.blue)
            }
        }
    }
    
    private var mapLayerView: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(
            center: locations.coordinates,
            span: MKCoordinateSpan(
                latitudeDelta: 0.01,
                longitudeDelta: 0.01
            ))),
            annotationItems: [locations]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10)
            }
        }
    }
    
    private var closeButton: some View {
        Button {
            viewModel.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(12)
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                .background(.thinMaterial)
                .clipShape(.rect(cornerRadius: 10))
                .shadow(radius: 5)
                .padding()
        }
        .environment(\.colorScheme, colorScheme)
    }
    
}
