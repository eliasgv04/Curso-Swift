//
//  MenuView.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 14/2/25.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationStack{
            List {
                NavigationLink(destination:IMCView()) {
                    Text("IMC Calculator")
                }
                NavigationLink(destination:SuperheroSearcher()) {
                    Text("Superhero Searcher")
                }
                NavigationLink(destination:FavPlaces()) {
                    Text("Fav Places")
                }
            }
        }
    }
}

#Preview {
    MenuView()
}
