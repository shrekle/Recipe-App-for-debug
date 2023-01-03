//
//  ContentView.swift
//  Recipe List App
//
//  Created by Christopher Ching on 2021-01-14.
//

import SwiftUI

struct RecipeListView: View {
        
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "name", ascending: true)])  private var recipes: FetchedResults<Recipe>
    
    @State var FilteredBy = ""
    
    var sortedRecipes: [Recipe] {
        
        if FilteredBy.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return Array(recipes)
        } else {
           return recipes.filter { r in
               r.name.contains(FilteredBy)
            }
        }
    }
    
    var body: some View {
        
        NavigationView {
            
            VStack (alignment: .leading) {
                
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                SearchBarView(filterBy: $FilteredBy)
                    .padding([.trailing, .bottom])
                
                ScrollView {
                    LazyVStack (alignment: .leading) {
                        ForEach(sortedRecipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(recipe:r),
                                label: {
                                    
                                    // MARK: Row item
                                    HStack(spacing: 20.0) {
                                        
                                        let image = UIImage(data: r.image ?? Data()) ?? UIImage()
                                        
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        
                                        VStack (alignment: .leading) {
                                            Text(r.name)
                                                .foregroundColor(.black)
                                                .font(Font.custom("Avenir Heavy", size: 16))
                                            
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                })
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
            .onTapGesture { //dont do this resignFirstResponder on the navigationStack, rather on the root view
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
            
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
