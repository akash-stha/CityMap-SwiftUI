//
//  LocationsListView.swift
//  CityMap_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-18.
//

import SwiftUI

struct LocationsListView: View {
    @EnvironmentObject private var viewModel: LocationsViewModel

    var body: some View {
        List {
            ForEach(viewModel.locations) { location in
                Button {
                    viewModel.showNextLoction(getLocation: location)
                } label: {
                    listRowView(getLocation: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)
            }
        }
        .listStyle(.plain)
    }
}

#Preview {
    LocationsListView()
        .environmentObject(LocationsViewModel())
}

extension LocationsListView {
    private func listRowView(getLocation: Location) -> some View {
        HStack {
            if let imageName = getLocation.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height:  45)
                    .clipShape(.rect(cornerRadius: 8))
//                    .overlay {
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(.black, lineWidth: 2)
//                    }
            }
            
            VStack(alignment: .leading) {
                Text(getLocation.name)
                    .font(.headline)
                Text(getLocation.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
