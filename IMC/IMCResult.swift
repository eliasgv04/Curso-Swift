//
//  IMCResult.swift
//  CursoSwift
//
//  Created by Elias Gonzalez Valdepeñas on 16/2/25.
//

import SwiftUI

struct IMCResult: View {
    let userWeight:Double
    let userHeight:Double
    
    var body: some View {
        VStack{
            Text("Tu resultado es: ").font(.title).bold().foregroundStyle(.white)
            let result = calculateIMC(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundApp)
    }
}

func calculateIMC(weight:Double, height:Double) -> Double{
    let result = weight/((height/100)*(height/100))
    return result
}

struct InformationView:View {
    let result:Double
    
    var body: some View {
        let information = getIMCResult(result: result)
        VStack{
            Spacer()
            Text(information.0).foregroundStyle(information.2).font(.title).bold()
            Spacer()
            Text("\(result, specifier: "%.2f")").font(.system(size: 80)).bold().foregroundStyle(.white)
            Spacer()
            Text(information.1).foregroundStyle(.white).font(.title2)
            Spacer()
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(.backgroundComponent).cornerRadius(16).padding(16)
    }
}

func getIMCResult(result:Double) -> (String, String, Color){
    let title:String
    let description:String
    let color:Color
    
    switch result{
    case 0.00...19.99:
        title = "PESO BAJO"
        description = "Estas por debajo del peso recomendado por el IMC"
        color = .yellow
    case 20.00...24.99:
        title = "PESO NORMAL"
        description = "Estas en el peso recomendado por el IMC"
        color = .green
    case 25.00...29.99:
        title = "SOBREPESO"
        description = "Estas por encima del peso recomendado por el IMC"
        color = .orange
    case 30.00...100.99:
        title = "OBESIDAD"
        description = "Estas muy por encima del peso recomendado por el IMC"
        color = .red
    default:
        title = "ERROR"
        description = "No se ha podido calcular su IMC"
        color = .red

    }
    return (title, description, color)
}

#Preview {
    IMCResult(userWeight: 80, userHeight: 190)
}
