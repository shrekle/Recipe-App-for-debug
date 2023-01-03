//
//  AddListData.swift
//  Recipe List App
//
//  Created by adrian garcia on 1/2/23.
//

import SwiftUI

struct AddListData: View {
    
    @Binding var list: [String] //  Binding it to the @State var highlights
    
    @State private var item = ""
    
    var title: String
    var placeholderText: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
               Text("\(title):")
                    .bold()
                TextField(placeholderText, text: $item)
                
                Button("Add") {
                    if item.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                        list.append(item.trimmingCharacters(in: .whitespacesAndNewlines))
                        item = ""
                    }
                }
            }
            
            ForEach(list, id:  \.self) {item in
                Text(item)
            }
            
        }
    }
}

struct ListData_Previews: PreviewProvider {
    static var previews: some View {
        AddListData(list: Binding.constant([]), title: "chupacabras", placeholderText: "write something")
    }
}
