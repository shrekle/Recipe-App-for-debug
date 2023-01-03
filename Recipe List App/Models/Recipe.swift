//
//  Recipe.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import Foundation

class RecipeGayson: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[IngredientGayson]
    var directions:[String]
    
}

class IngredientGayson: Identifiable, Decodable {
    // for this class to have an initializer when creating a new instance of it, you need to eighter give the name property a value from the start or have a init() that gives name a value, only name cuz the others are optiona''
    var id:UUID?
    var name:String = ""
    var num:Int?
    var denom:Int?
    var unit:String?
    
    
}
