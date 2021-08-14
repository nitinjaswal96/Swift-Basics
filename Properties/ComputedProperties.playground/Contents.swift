import UIKit

struct Circle {
    var radius: Double = 0
    var area: Double {
        get {
            return Double.pi * radius * radius
        }
        set(areaValue) {
            debugPrint(areaValue)
            radius = areaValue
        }
        
    }
}

var circleObj = Circle()
circleObj.area = 5
debugPrint(circleObj.radius)

