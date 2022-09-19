/*
### Homework 2
Grades
Remi Denoyer
2022-08-26
*/
let grades = [100,0,50,95,89,67,54,100,89,80]

for grade in grades {
    switch grade {
    case 90...Int.max:
        print("\(grade) : A")
    case 80..<90:
        print("\(grade) : B")
    case 70..<80:
        print("\(grade) : C")
    case 60..<70:
        print("\(grade) : D")
    case Int.min..<60:
        print("\(grade) : E")
    default:
        print("\(grade) : F")
    }
}
