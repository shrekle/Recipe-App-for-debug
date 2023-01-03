//
//  AddMetaData.swift
//  Recipe List App
//
//  Created by adrian garcia on 1/2/23.
//

import SwiftUI

struct AddMetaData: View {
    
    @Binding var name: String
    @Binding var summary: String
    @Binding var prepTime: String
    @Binding var cookTime: String
    @Binding var totalTime: String
    @Binding var servings: String
    
    var body: some View {
        
        Group {
            HStack {
                Text("name")
                TextField("taco", text: $name)
            }
            HStack {
                Text("summary")
                TextField("A good meal for the whole family", text: $summary)
            }
            HStack {
                Text("Prep Time")
                TextField("2 hours", text: $prepTime)
            }
            HStack {
                Text("Cook Time")
                TextField("3 hours", text: $cookTime)
            }
            HStack {
                Text("Total Time")
                TextField("6 hours", text: $totalTime)
            }
            HStack {
                Text("Servings")
                TextField("7", text: $servings)
            }
        }
    }
}

struct AddMetaData_Previews: PreviewProvider {
    static var previews: some View {
        AddMetaData(name: Binding.constant("name"), summary: Binding.constant("summary"), prepTime: Binding.constant("preptime"), cookTime: Binding.constant("cooktime"), totalTime: Binding.constant("totalTime"), servings: Binding.constant("servings"))
    }
}
