//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation
import SwiftUI

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    let managedObjectContext = PersistenceController.shared.container.viewContext
    
    init() {
        
      checkLoadedData()
       
    }
    
    func checkLoadedData() {
        
        // this bool thing eigther returns true or false, it doesnt return nil, so when you initialize the key without saying a value, it defaults to false
        let status = UserDefaults.standard.bool(forKey: Constants.isDataPreloaded) // it gets set to true after the data is sucessfuly save to coreData

        if status == false {
            
            preLoadLocalData()
            
        }
    }
    
    func preLoadLocalData() {
       let localRecipes = DataService.getLocalData()
        for r in localRecipes {
            let recipe = Recipe(context: managedObjectContext) // this is the model of Recipe or the struct basically
            recipe.id = UUID()
            recipe.name = r.name
            recipe.featured = r.featured
            recipe.summary = r.description
            recipe.prepTime = r.prepTime
            recipe.cookTime = r.cookTime
            recipe.totalTime = r.totalTime
            recipe.servings = r.servings
            recipe.highlights = r.highlights
            recipe.directions = r.directions
            recipe.image = UIImage(named: r.image)?.jpegData(compressionQuality: 1.0)
            
            for i in r.ingredients {
                
                let ingredient = Ingredient(context: managedObjectContext) // this is the model of Ingredients or the struct basically
                
                ingredient.id = UUID()
                ingredient.name = i.name
                ingredient.num = i.num ?? 1
                ingredient.denom = i.denom ?? 1
                ingredient.unit = i.unit
                
                recipe.addToIngredients(ingredient)
//                Recipe(context: managedObjectContext).addToIngredients(ingredient)
            }
        }
        do {
            try managedObjectContext.save()
            
            UserDefaults.standard.set(true, forKey: Constants.isDataPreloaded)
        } catch {}
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num
        var denominator = ingredient.denom
        var wholePortions = 0
        
        // Get a single serving size by multiplying denominator by the recipe servings
        denominator *= recipeServings
        
        // Get target portion by multiplying numerator by target servings
        numerator *= targetServings
        
        // Reduce fraction by greatest common divisor
        let divisor = Rational.greatestCommonDivisor(numerator, denominator)
        numerator /= divisor
        denominator /= divisor
        
        // Get the whole portion if numerator > denominator
        if numerator >= denominator {
            
            // Calculated whole portions
            wholePortions = numerator / denominator
            
            // Calculate the remainder
            numerator = numerator % denominator
            
            // Assign to portion string
            portion += String(wholePortions)
        }
        
        // Express the remainder as a fraction
        if numerator > 0 {
            
            // Assign remainder as fraction to the portion string
            portion += wholePortions > 0 ? " " : ""
            portion += "\(numerator)/\(denominator)"
        }
        
        if var unit = ingredient.unit {
            
            // If we need to pluralize
            if wholePortions > 1 {
                
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
    }
}
