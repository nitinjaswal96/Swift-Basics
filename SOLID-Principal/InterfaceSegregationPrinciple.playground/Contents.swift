import UIKit

// Interface-segregation principle (ISP) states that no client should be forced to depend on methods it does not use. 

protocol Mammal {
    func eat()
    func sleep()
}

protocol Human: Mammal {
    func goToWork()
    func buyAHouse()
}

protocol Animal: Mammal {
    func hunt()
}

// MARK: Classes
class Person: Human {
    func goToWork() {
        debugPrint("Person goes to work")
    }
    
    func buyAHouse() {
        debugPrint("Person buys a house")
    }
    
    func eat() {
        debugPrint("Person eats food")
    }
    
    func sleep() {
        debugPrint("Person sleep")
    }
}

