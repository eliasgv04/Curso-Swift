//
//  LabelExample.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 7/2/25.
//

import SwiftUI

struct LabelExample: View {
    var body: some View {
        Label("ESTA ES LA FIGURA DE UN JUGADOR DE BADMINTON", systemImage: "figure.badminton")
        Label(
            title: {Text("ESTE ES ALVARITO")},
            icon: {Image("FotoTorrenuevaFS")
                .resizable().scaledToFit()
                .frame(height: 140) }
        )
    }
}

#Preview {
    LabelExample()
}
