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
    var body: some View {
        // creating instances of structs,named parameters,parameter defaults
        // @ViewBulder TupleView(bag of Lego)
        // View modifier scope
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                // View modifier
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
            } else {
                // View modifier
                RoundedRectangle(cornerRadius: 12)
            }
        })
    }
}

#Preview {
    ContentView()
}
