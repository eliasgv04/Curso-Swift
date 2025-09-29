//
//  FavPlaces.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 18/2/25.
//

import SwiftUI
import MapKit

struct FavPlaces: View {
    @State var position = MapCameraPosition.region(MKCoordinateRegion(
        center:CLLocationCoordinate2D(latitude: 40.419969, longitude: -3.702561),
        span:MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)))
    
    @State var places:[Place] = []
    
    var body: some View {
        ZStack{
            MapReader{ proxy in
                Map()
                    .onTapGesture {
                        
                    }
            }
        }
    }
}

#Preview {
    FavPlaces()
}
