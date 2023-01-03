//
//  AddIngredientData.swift
//  Recipe List App
//
//  Created by adrian garcia on 1/2/23.
//

import SwiftUI

struct AddIngredientData: View {
    
    @Binding var ingredients: [IngredientGayson]
    
    @State private var name = ""
    @State private var num = ""
    @State private var denom = ""
    @State private var unit = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Ingredients:")
                .bold()
                .padding(.top, 5)
            HStack {
                TextField("sugar", text: $name)
                TextField("1", text: $num)
                    .frame(width: 20)
                Text("/")
                TextField("2", text: $denom)
                    .frame(width: 20)
                TextField("unit", text: $unit)
                
                Button("Add") {
                    
                    let cleanedName = name.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedNum = num.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedDenom = denom.trimmingCharacters(in: .whitespacesAndNewlines)
                    let cleanedUnit = unit.trimmingCharacters(in: .whitespacesAndNewlines)
                    
                    let i = IngredientGayson()
                    i.id = UUID()
                    i.name = cleanedName
                    i.num = Int(cleanedNum) ?? 1
                    i.denom = Int(cleanedDenom) ?? 1
                    i.unit = cleanedUnit
                    
                    ingredients.append(i)
                    
                    name = ""
                    num = ""
                    denom = ""
                    unit = ""
                    
                }
            }
            ForEach(ingredients) { i in
                
                Text("\(i.name) \(i.num ?? 1)/\(i.denom ?? 1) \(i.unit ?? "")")
                    
            }
        }
    }
}

struct AddIngredientData_Previews: PreviewProvider {
    static var previews: some View {
        AddIngredientData(ingredients: Binding.constant([]))
    }
}
