//
//  SuperheroSearcher.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 17/2/25.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperheroSearcher: View {
    @State var superheroName:String = ""
    @State var wrapper:ApiNetwork.Wrapper? = nil
    @State var loading:Bool = false
    
    var body: some View {
        VStack{
            TextField("", text: $superheroName, prompt: Text("Escriba el nombre de un superheroe").font(.title3).bold().foregroundStyle(.gray))
                .font(.title2)
                .bold()
                .foregroundStyle(.white)
                .padding(16)
                .border(.purple, width: 2)
                .padding(10)
                .autocorrectionDisabled()
                .onSubmit {
                    loading = true
                    print(superheroName)
                    Task{
                        do{
                            wrapper = try await ApiNetwork().getHeroesByQuery(query: superheroName)
                        }catch{
                            print("Error")
                        }
                        loading = false
                    }
                }
            
            if(loading){
                ProgressView().tint(Color(.white))
            }
            NavigationStack{
                List(wrapper?.results ?? []){ superhero in // Si no existe me va a devolver un array vacio
                    ZStack{
                        SuperheroItem(superhero : superhero)
                        NavigationLink(destination: SuperheroDetail(id:superhero.id)){EmptyView()}.opacity(0)
                    }.listRowBackground(Color.backgroundApp)
                }.listStyle(.plain)
            }
            
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

struct SuperheroItem:View {
    let superhero:ApiNetwork.Superhero
    var body: some View {
        ZStack{
            Rectangle()
            WebImage(url:URL(string: superhero.image.url)).resizable().indicator(.activity).scaledToFill().frame(height: 200)
            VStack{
                Spacer()
                Text(superhero.name).foregroundStyle(.white)
                    .font(.title)
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.5))
            }
        }.frame(height: 200).cornerRadius(32).listRowBackground(Color.backgroundApp)
    }
}

#Preview {
    SuperheroSearcher()
}
