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
    let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙‍♀️", "🙀", "👹", "😱", "☠️", "🍭"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        // creating instances of structs,named parameters,parameter defaults
        // @ViewBulder TupleView(bag of Lego)
        // View modifier scope
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        // implicit return
        // Well the reason for that is if you have a normal function and it only has one line of code,and this is one line of code,it's got a lot of in it but it's one line of code,then you don't need this return.It's called implicit return,and this works in functions and computer properties,if it's one line of code like this.
        // LazyVGrid
        // Because LazyVGrid uses as little space as it can,whereas HStack uses as munch space as it can,it's just the way they're defined.
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            // ForEach
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index]).aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    // func
    func cardCountAdjusters(by offset: Int, symbol: String) -> some View {
        // Button
        Button(action: {
            cardCount += offset
        }, label: {
            // Image(systemName:) Lookup
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        return cardCountAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjusters(by: +1, symbol: "rectangle.stack.badge.plus.fill")
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
            // View modifier
            // opacity vs if - else in @ViewBuilder
            Group {
                // View modifier
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture {
            // print to console
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
