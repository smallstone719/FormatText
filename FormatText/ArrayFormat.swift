//
//  ArrayFormat.swift
//  FormatText
//
//  Created by Thach Nguyen Trong on 5/21/24.
//

import SwiftUI

struct ArrayFormat: View {
    @State private var ingredients: [String] = []
    @State private var rolls = [Int]()
    var body: some View {
        NavigationStack {
            Form {
                Section("Array String") {
                    Text(ingredients, format: .list(type: .and))
                    Button("Add Ingredient") {
                        let possibles = ["Egg", "Sausage", "Bacon", "Spam"]
                        if let newIngredient = possibles.randomElement() {
                            ingredients.append(newIngredient)
                        }
                    }
                    ///https://sarunw.com/posts/swiftui-button-style-examples/
                    .buttonStyle(.automatic)// automatic, borderless, plain, bordered, borderedProminent
                }
                .textCase(.none)
                
                Section("Array Int") {
                    Text(rolls, format: .list(memberStyle: .number, type: .and))
                    
                    Button("Roll Dice") {
                        let result = Int.random(in: 1...6)
                        rolls.append(result)
                    }
                }
                .textCase(.none)
               
                
            }
            .navigationTitle("Array Formater")
        }
       
    }
}

#Preview {
    ContentView()
}
