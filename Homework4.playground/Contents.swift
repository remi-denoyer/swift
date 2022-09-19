/*
 Assignment #4
 Remi Denoyer
 2022-11-12
 */

import UIKit



/* Dictionnary creation:
 The following block initialize dog with a dict<string, string> where keys are dogs' names and values are descriptions.
 */
var keys = [
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
var values = [
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

var dogs = Dictionary(uniqueKeysWithValues: zip(keys, values))



/* Random Dog:
 Initialize random dog to a dict element (unwrapping the optional as I know my dict is not empty)
 Print dog name and description
 Create image of the dog with the relevant file name
 */

var randomDog = dogs.randomElement()! // We know the array is not empty so I can unwrap.

print("Random dog: \(randomDog.key)\nRandom dog description: \(randomDog.value)\n")

var dogImg = UIImage(named:randomDog.key.lowercased().replacingOccurrences(of: " ", with: "_") + ".jpg")



/* All Dogs:
 Print all dogs except the random dog
 */

for (dogName, dogDescription) in dogs {
    if dogName == randomDog.key { continue }
    print("Dog: \(dogName)\nDog description: \(dogDescription)\n\n")
}

