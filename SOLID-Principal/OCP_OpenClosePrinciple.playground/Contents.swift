import UIKit

/// Open Close Principle: the code should be open for extensions but closed for modification. Here in the example we can create the multiple classes for different shape but we won't need to modify the manager class, since via dependency inversion principle technique we can pass the reference of protocol dynamically.

protocol Shape {
    func calculateArea() -> Double
}

class Triangle: Shape {
    let base: Double
    let height: Double
    
    init(_base: Double, _height: Double) {
        base = _base
        height = _height
    }
    
    func calculateArea() -> Double {
        return 1/2 * base * height
    }
}

class Rectangle: Shape {
    let width: Double
    let height: Double
    
    init(_width: Double, _height: Double) {
        width = _width
        height = _height
    }
    
    func calculateArea() -> Double {
        return width * height
    }
}

class Circle: Shape {
    let radius: Double
    
    init(_radius: Double) {
        radius = _radius
    }
    
    func calculateArea() -> Double {
        return Double.pi * radius * radius
    }
}

class AreaCalculator {
    func area(shape: Shape) -> Double {
        return shape.calculateArea()
    }
    
}

let objAreaCalculator = AreaCalculator()
let objRectangle = Rectangle(_width: 2, _height: 2)
debugPrint("Area = \(objAreaCalculator.area(shape: objRectangle))")

let objCircle = Circle(_radius: 5)
debugPrint("Area = \(objAreaCalculator.area(shape: objCircle))")

let objTriangle = Triangle(_base: 40, _height: 30)
debugPrint("Area = \(objAreaCalculator.area(shape: objTriangle))")
