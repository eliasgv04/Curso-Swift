//
//  ButtonExample.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 7/2/25.
//

import SwiftUI

struct ButtonExample: View {
    var body: some View {
        Button("Hola"){
            print("Hola a todos amigos")
        }
        Button(action: {print("Hola a todos")}, label: {Text("hello")
                .frame(width: 200, height: 100)
                .foregroundColor(.white)
                .background(.blue)
            .cornerRadius(20)})
    }
}

struct Counter:View {
    // Para poder modificar el estado del boton tendremos que anadir el @State
    @State var subscribersNumber = 0
    var body: some View {
        Button(action: {
            subscribersNumber += 1
        }, label: {
            Text("Suscriptores: \(subscribersNumber)")
                .bold()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .frame(width:300, height: 50)
                .foregroundColor(.white)
                .background(.red)
                .cornerRadius(10)
        })
    }
}

#Preview {
    ButtonExample()
    Counter()
}
