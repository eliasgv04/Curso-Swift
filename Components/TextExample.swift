//
//  TextExample.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 7/2/25.
//

import SwiftUI

struct TextExample: View {
    var body: some View {
        VStack{
            Text("Hello, World!").font(.headline)
            Text("Custom").font(.system(size: 40, weight: .light, design: .monospaced))
                .bold()
                .italic()
                .underline()
                .foregroundStyle(.red)
                .background(.blue)
            Text("Aris aris aris aris aris aris").frame(width: 50).lineLimit(3).lineSpacing(15)
            
        }
    }
}

#Preview {
    TextExample()
}
