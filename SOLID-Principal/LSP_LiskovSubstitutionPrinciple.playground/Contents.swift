import UIKit

// Liskov Substitution Principal: objects of a superclass shall be replaceable with objects of its subclasses without breaking the application.

// While performing inheritance we should not override the supper class methods or variable. Instead we should replace it using the Protocol methods or variable

//class Rectangle {
//    var width: Double = 0
//    var length: Double = 0
//
//    var area: Double {
//        return width * length
//    }
//}
//
//class Square: Rectangle {
//
//    override var width: Double{
//        didSet {
//            length = width
//        }
//    }
//}
//
//let objRectangle = Rectangle()
//objRectangle.length = 5
//objRectangle.width = 3
//debugPrint(objRectangle.area)
//
//let objSquare = Square()
//objSquare.width = 3
//debugPrint(objSquare.area)

protocol Shape {
    var area: Double { get }
}

class Rectangle: Shape {
    var width: Double = 0
    var length: Double = 0
    
    var area: Double {
        return width * length
    }
}

class Square: Shape {
    var width: Double = 0
    
    var area: Double {
        return pow(width, 2)
    }
}

let objRectangle = Rectangle()
objRectangle.length = 5
objRectangle.width = 3
debugPrint(objRectangle.area)

let objSquare = Square()
objSquare.width = 3
debugPrint(objSquare.area)
