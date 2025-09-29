//
//  ImageExample.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 7/2/25.
//

import SwiftUI

struct ImageExample: View {
    var body: some View {
        Image("FotoTorrenuevaFS").resizable().scaledToFit()
            .frame(width: 300, height: 200)
        Image(systemName: "figure.walk").resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    ImageExample()
}
