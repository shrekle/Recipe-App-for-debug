//
//  AddRecipeView.swift
//  Recipe List App
//
//  Created by adrian garcia on 1/2/23.
//

import SwiftUI

struct AddRecipeView: View {
    
    @State private var name = ""
    @State private var summary = ""
    @State private var prepTime = ""
    @State private var cookTime = ""
    @State private var totalTime = ""
    @State private var servings = ""
    
    @State private var highlights = [String]()
    @State private var directions = [String]()
    
    @State private var ingredients = [IngredientGayson]()
    
    @State private var isShowingImagePicker = false
    @State private var selectedImageSource = UIImagePickerController.SourceType.photoLibrary
    
    var body: some View {
        VStack {
            HStack {
                Button("Clear") {
                    clear()
                }
                
                Spacer()
                
                Button("Add") {
                    
                }
            }
            ScrollView(showsIndicators: false) {
                VStack {
                    Image("dumpi")
                        .resizable()
                        .scaledToFit()
                    HStack{
                        Button("Photo Library") {
                            selectedImageSource = .photoLibrary
                            isShowingImagePicker = true
                        }
                        Text(" | ")
                        
                        Button("Camara") {
                            selectedImageSource = .camera
                            isShowingImagePicker = true
                        }
                    }
                    .sheet(isPresented: $isShowingImagePicker) {
                        ImagePicker(selectedImageSource: selectedImageSource)
                    }
                    
                    AddMetaData(name: $name, summary: $summary, prepTime: $prepTime, cookTime: $cookTime, totalTime: $totalTime, servings: $servings)
                    
                    AddListData(list: $highlights, title: "Highlights", placeholderText: "Add a Highlights")
                    
                    AddListData(list: $directions, title: "Directions", placeholderText: "Add Directions")
                    
                    AddIngredientData(ingredients: $ingredients)
                }
            }
        }
        .padding(.horizontal)
    }
    
    func clear() {
        name = ""
        summary = ""
        prepTime = ""
        cookTime = ""
        totalTime = ""
        servings = ""
        
        highlights = [String]()
        directions = [String]()
        
        ingredients = [IngredientGayson]()
    }
    
    func addrecipe() {
        
    }
}

//struct AddRecipeView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddRecipeView()
//    }
//}
