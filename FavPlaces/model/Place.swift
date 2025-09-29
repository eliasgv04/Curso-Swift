//
//  Place.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 18/2/25.
//

import Foundation
import MapKit

struct Place:Identifiable{
    let id = UUID()
    var name:String
    var coordinates:CLLocationCoordinate2D
    var fav:Bool
}
