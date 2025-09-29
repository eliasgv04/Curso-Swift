//
//  TextFieldExample.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 7/2/25.
//

import SwiftUI



struct TextFieldExample: View {
    @State var email = ""
    @State var password = ""

    var body: some View {
        VStack {
            TextField("Escribe tu email", text: $email)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(20)
                .padding(.horizontal, 16)
                .onChange(of: email) { oldValue, newValue in print("El antiguo valor del usuario era \(oldValue) y el nuevo es \(newValue)")}
            
            SecureField("Escribe tu password", text: $password)
                .keyboardType(.emailAddress)
                .padding(16)
                .background(.gray.opacity(0.2))
                .cornerRadius(20)
                .padding(.horizontal, 16)
                .onChange(of: password) { oldValue, newValue in print("El antiguo valor del password era \(oldValue) y el nuevo es \(newValue)")}
        }
    }
}

#Preview {
    TextFieldExample()
}
