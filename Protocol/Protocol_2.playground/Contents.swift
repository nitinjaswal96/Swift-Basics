import UIKit

//
//

protocol Engine {
    func startEngine()
    func stopEngine()
}

protocol SpeedControl {
    func increaseSpeed()
    func decreaseSpeed()
}

protocol Safety {
    func releaseAirBags()
    func applyUrgentBrakes()
}

protocol Car: Engine, SpeedControl, Safety {
    func applyBreaks()
}

class Audi8: Car {
    func applyBreaks() {
        debugPrint("")
    }
    
    func startEngine() {
        debugPrint("")
    }
    
    func stopEngine() {
        debugPrint("")
    }
    
    func increaseSpeed() {
        debugPrint("")
    }
    
    func decreaseSpeed() {
        debugPrint("")
    }
    
    func releaseAirBags() {
        debugPrint("")
    }
    
    func applyUrgentBrakes() {
        debugPrint("")
    }
}
