//
//  LocationsPreviewView.swift
//  CityMap_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-18.
//

import SwiftUI

struct LocationsPreviewView: View {
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreBtn
                nextBtn
            }
        }
        .padding(20)
        .background((RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial).offset(y: 65)))
        .clipShape(.rect(cornerRadius: 10))
    }
    
}

#Preview {
    ZStack {
        Color.green.ignoresSafeArea()
        LocationsPreviewView(location: LocationsDataService.locations.first!)
            .padding()
    }
}

extension LocationsPreviewView {
    private var imageSection: some View {
        ZStack {
            if let getImage = location.imageNames.first {
                Image(getImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(.rect(cornerRadius: 8))
            }
        }
        .padding(6)
        .background(.white)
        .clipShape(.rect(cornerRadius: 8))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreBtn: some View {
        Button {
            
        } label: {
            Text("Learn More")
                .font(.headline)
                .frame(width: 95, height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextBtn: some View {
        Button {
            
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 95, height: 30)
        }
        .buttonStyle(.bordered)
    }
}