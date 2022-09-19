/*
### Homework 2
Animal array
Remi Denoyer
2022-08-26
*/
let animalArray = [
    "Wolf",
    "Snake",
    "Aligator",
    "T-Rex",
    "Dolphin",
]

var index: Int?
index = 2

if index != nil && index! >= 0 && index! < animalArray.count {
    print(animalArray[index!])
} else {
    print("Error: Index not initialized or out of range.")
}
