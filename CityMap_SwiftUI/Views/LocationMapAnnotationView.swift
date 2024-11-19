//
//  LocationMapAnnotationView.swift
//  CityMap_SwiftUI
//
//  Created by Akash Shrestha on 2024-11-18.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    let accentColor = Color.accentColor
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "map.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .padding(6)
                .background(.accent)
                .clipShape(.rect(cornerRadius: 46))
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .foregroundColor(.accent)
                .rotationEffect(.degrees(180))
                .offset(y: -3)
                .padding(.bottom, 50)
        }
    }
}

#Preview {
    LocationMapAnnotationView()
}
