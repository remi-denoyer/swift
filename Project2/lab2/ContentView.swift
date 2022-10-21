/*
 Lab2
 Group7
 Remi Denoyer & Orlando Garcia
 2022-10-20
 
 This project is displaying 16 pokemon cards that are changing at each build.
 Cards can be put face up or down
 
 Iamges are from the public dataset: https://www.kaggle.com/datasets/dollarakshay/pokemon-images
 
 */

import SwiftUI

var numberOfCards = 16

struct ContentView: View {
    var imagesSet = Set<String>()
    init() {
        
        while imagesSet.count < numberOfCards - 1 {
            imagesSet.insert(String(format: "%04d", Int.random(in: 1...151)))
        }
    }

    var body: some View {
        ScrollView {
            Text("Pokemon cards")
                .font(.largeTitle)
                .bold()
            LazyVGrid(
                columns: [
                    GridItem(
                        .adaptive(minimum: 100),
                        spacing: 1
                    )
                ]
            ) {
                let images = Array(imagesSet)
                ForEach(
                    images[0..<images.count],
                    id:\.self
                ) {
                    image in PokemonCards(content: image)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
        }
    }
}

struct PokemonCards: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.blue)
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .foregroundColor(.blue)
            Image(content)
                .resizable()
                .scaledToFit()
                .padding()
            if isFaceUp {
                shape.opacity(0)
            } else {
                shape.opacity(1)
            }
        }
        .padding(.horizontal)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
