import UIKit

protocol Car {
    func startEngine()
    func pressHorn()
    func stopCar()
}

class Rogue: Car {
    func startEngine() {
        debugPrint("driver started Rogue..")
    }
    
    func pressHorn() {
        debugPrint("Honk Honk..")
    }
    
    func stopCar() {
        debugPrint("driver stoped Rogue..")
    }
}

class Audi: Car {
    func startEngine() {
        debugPrint("driver started Audi..")
    }
    
    func pressHorn() {
        debugPrint("Pom Pom..")
    }
    
    func stopCar() {
        debugPrint("driver stoped Audi..")
    }
}

class Person {
    // loose coupled argument
    func driveTheCar(car: Car) {
        car.startEngine()
        car.pressHorn()
        car.stopCar()
    }
    
//    // tight coupled argument
//    func driveTheCar(car: Rogue) {
//        car.startEngine()
//        car.pressHorn()
//        car.stopCar()
//    }
}

let objRogue = Rogue()
let objAudi = Audi()

let objPerson = Person()
objPerson.driveTheCar(car: objAudi)


