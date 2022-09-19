/*
 Project 1
 Remi Denoyer, Orlando Garcia
 2022-09-18
 */

import SwiftUI

// Constants
let NCOL = 3
let keys = [
    "Airedale Terrier",
    "American Foxhound",
    "Dutch Shepherd",
    "Havanese",
    "Leonberger",
    "Mudi",
    "Norwegian Lundehund",
    "Pharaoh Hound",
    "Scottish Terrier",
    "Tosa",
]
let values = [
    "The Airedale stands among the world's most versatile dog breeds and has distinguished himself as hunter, athlete, and companion.",
    "American Foxhounds are good-natured, low-maintenance hounds who get on well with kids, dogs, even cats, but come with special considerations for prospective owners.",
    "The Dutch Shepherd is a lively, athletic, alert and intelligent breed, and has retained its herding instinct for which it was originally developed.",
    "Havanese, the only dog breed native to Cuba, are vivacious and sociable companions and are especially popular with American city dwellers.",
    "The Leonberger is a lush-coated giant of German origin. They have a gentle nature and serene patience and they relish the companionship of the whole family.",
    "The Mudi is an extremely versatile, intelligent, alert, agile, all-purpose Hungarian farm dog. The breed is a loyal protector of property and family members without being overly aggressive.",
    "From Norway’s rocky island of Vaeroy, the uniquely constructed Norwegian Lundehund is the only dog breed created for the job of puffin hunting. With puffins now a protected species, today’s Lundehund is a friendly, athletic companion.",
    "The Pharaoh Hound, ancient \"Blushing Dog\" of Malta, is an elegant but rugged sprinting hound bred to course small game over punishing terrain. Quick and tenacious on scent, these friendly, affectionate hounds settle down nicely at home.",
    "A solidly compact dog of vivid personality, the Scottish Terrier is an independent, confident companion of high spirits. Scotties have a dignified, almost-human character.",
    "The Tosa's temperament is marked by patience, composure, boldness and courage. He is normally a tranquil, quiet, and obedient dog, with a calm but vigilant demeanor.",
]
let dogsTemp = Dictionary(uniqueKeysWithValues: zip(keys, values))

// Helper class
struct Dog: Identifiable {
    var name: String
    var description: String
    let id = UUID()
    
    init(dogName: String, dogDescription: String) {
        name = dogName
        description = dogDescription
    }
    func getFileName() -> String {
        return self.name.lowercased().replacingOccurrences(of: " ", with: "_")
    }
}
var dogs: [Dog] = [Dog]()

// Fetch function
func loadDogs() {
    dogs = []
    for (dogName, dogDescription) in dogsTemp {
        dogs.append(Dog(dogName: dogName, dogDescription: dogDescription))
    }
}

// Helper components
struct DogComponent: View {
    let dog: Dog
    let onTap: (String) -> Void
    var body: some View {
        VStack {
            Text(self.dog.name)
            Image(self.dog.getFileName()).resizable().scaledToFit().onTapGesture {
                onTap(self.dog.description)
            }
        }
    }
    init(dog: Dog, onTap: @escaping (String) -> Void) {
        self.dog = dog
        self.onTap = onTap
    }
}

struct DogsRow: View {
    let dogs: Array<Dog>.SubSequence
    let onTap: (String) -> Void
    var body: some View {
        VStack {
            ForEach(self.dogs) { dog in
                DogComponent(dog: dog, onTap: onTap)
            }
        }
    }
    init(dogs: Array<Dog>.SubSequence, onTap: @escaping (String) -> Void) {
        self.dogs = dogs
        self.onTap = onTap
    }
}

// Main function
struct ContentView: View {
    @State private var descriptionState = ""
    
    init() {
        loadDogs()
    }
    
    func updateDescription(newDesc: String) {
        descriptionState = newDesc
    }
    
    var body: some View {
        if ( !dogs.isEmpty ) {
            Text("Tap on dog to see description")
            let dogRows = [
                dogs[0...dogs.count/3],
                dogs[dogs.count/3+1...2*dogs.count/3],
                dogs[2*dogs.count/3+1...dogs.count-1]
            ]
            VStack {
                HStack {
                    DogsRow(dogs: dogRows[0], onTap: updateDescription)
                    DogsRow(dogs: dogRows[1], onTap: updateDescription)
                    DogsRow(dogs: dogRows[2], onTap: updateDescription)
                }
                Text("Description of the dog selected:")
                Text(descriptionState)
            }
        } else {
            Text("Loading")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
