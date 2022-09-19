/*
 ### Homework 3
 Rectangle & Box
 Remi Denoyer
 2022-08-26
 */


class Rectangle {
    var length: Double
    var width: Double
    
    init(_ length: Double, _ width: Double ) {
        self.length = length
        self.width = width
    }
    
    func displayDimensions() {
        print("length: \(self.length), width: \(self.width)")
    }
    
    func calculateArea() -> Double {
        return self.length * self.width
    }
}
class Box : Rectangle {
    var height: Double
    
    init(_ length: Double, _ width: Double, _ height: Double ) {
        self.height = height
        super.init(length, width)
    }
    override func displayDimensions() {
        print("length: \(self.length), width: \(self.width), height \(self.height)")
    }
    
    func calculateVolume() -> Double {
        return calculateArea() * self.height
    }
}


let myRectangle = Rectangle(30,60)

myRectangle.displayDimensions()
print("My rectangle has an area of: \(myRectangle.calculateArea())")


let myBox = Box(30,60,50)
myBox.displayDimensions()
print("My box has an area of: \(myBox.calculateArea())")
print("My box has a volume of: \(myBox.calculateVolume())")

