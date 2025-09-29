//
//  ListExample.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 17/2/25.
//

import SwiftUI

var pokemons = [
    Pokemon(name: "Pikachu"),
    Pokemon(name: "Charmander"),
    Pokemon(name: "Charizard"),
    Pokemon(name: "Aron")
]

var digimons = [
    Digimon(name: "Agumon"),
    Digimon(name: "Graymon"),
    Digimon(name: "Supermon"),
    Digimon(name: "Supermon")
]
    


struct ListExample: View {
    var body: some View {
        List{
            Section(header: Text("Pokemons")){
                ForEach(pokemons, id:\.name){ pokemon in
                    Text(pokemon.name)
                }
            }
            Section(header: Text("Digimons")){
                ForEach(digimons){digimon in
                    Text(digimon.name)
                }
            }
        }.listStyle(.automatic) // Posibles personalizables para las listas por defecto
        
        
           
    }
}


struct Pokemon{
    let name:String
}

struct Digimon:Identifiable{
    var id = UUID()
    let name:String
}

#Preview {
    ListExample()
}
