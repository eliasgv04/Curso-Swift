//
//  ApiNetwork.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 17/2/25.
//

import Foundation

class ApiNetwork{
    
    struct Wrapper:Codable{
        let response:String
        let results:[Superhero]
    }
    
    struct Superhero:Codable, Identifiable{
        let id:String
        let name:String
        let image:ImageSuperHero
    }
    
    struct ImageSuperHero:Codable{
        let url:String
    }
    
    struct SuperheroCompleted:Codable{
        let id:String
        let name:String
        let image:ImageSuperHero
        let powerstats:Powerstats
        let biography:Biography
    }
    
    struct Powerstats:Codable{
        let intelligence:String
        let strength:String
        let speed:String
        let durability:String
        let power:String
        let combat:String
    }
    
    struct Biography:Codable{
        let alignment:String
        let publisher:String
        let aliases:[String]
        let fullName:String
        
        enum CodingKeys:String, CodingKey{
            case fullName = "full-name"
            case alignment = "alignment"
            case publisher = "publisher"
            case aliases = "aliases"
        }
    }
    
    func getHeroesByQuery(query:String) async throws -> Wrapper{
        let url = URL(string:"https://superheroapi.com/api/c6e63790dc07a1f35d617a16651118d6/search/\(query)")!
        
        let (data, _) = try await URLSession.shared.data(from: url) // Usamos el try await para la funcion asincrona, la _ es porque ese dato no lo vamos a usar, en data tenemos toda la informacion y hay que convertirla al modelo de datos que necesitamos
        
        let wrapper = try JSONDecoder().decode(Wrapper.self, from: data)
        return wrapper
    }
    
    func getHeroById(id:String) async throws -> SuperheroCompleted{
        let url = URL(string:"https://superheroapi.com/api/c6e63790dc07a1f35d617a16651118d6/\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url) // Usamos el try await para la funcion asincrona, la _ es porque ese dato no lo vamos a usar, en data tenemos toda la informacion y hay que convertirla al modelo de datos que necesitamos

        return try JSONDecoder().decode(ApiNetwork.SuperheroCompleted.self, from: data)
    }
}
