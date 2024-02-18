//
//  ContentView.swift
//  Memorize
//
//  Created by Admin on 2024/2/18.
//

import SwiftUI

// behave like a ...
struct ContentView: View {
    // Computed Proprety
    // Array
    let emojis = ["👻", "🎃", "🕷️", "😈", "😈"]
    
    var body: some View {
        // creating instances of structs,named parameters,parameter defaults
        // @ViewBulder TupleView(bag of Lego)
        // View modifier scope
        HStack {
            // ForEach
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    // let vs var
    // if you want some advice, always start out with let and the compiler will complain
    // @State
    // That @State is actually creating a pointer to a little piece of memory where it keeps XXX.
    // So now the pointer never changes,the pointer itself,the thing it points to can change,but the pointer never changes.
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        // trailing closure syntax
        ZStack {
            // locals in @ViewBuilder
            // Type Inference
            // Swift is what's called a extremely strongly typed language.
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                // View modifier
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                // View modifier
                base.fill()
            }
        }.onTapGesture {
            // print to console
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
