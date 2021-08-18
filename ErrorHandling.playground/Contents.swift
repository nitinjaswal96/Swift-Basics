import UIKit

enum BikeError: Error {
    case inSufficientPetrolQuantity(neededPetrolQuantity: Int)
    case inSufficientAge(neededAge: Int)
}

struct Bike {
    func startPicnic(petrolQuantity: Int) throws -> String {
        if petrolQuantity < 4 {
            throw BikeError.inSufficientPetrolQuantity(neededPetrolQuantity: 4)
        }
        return "Pinci begins"
    }
    
    func rideBike(age: Int) throws -> String {
        if age < 18 {
            throw BikeError.inSufficientAge(neededAge: 18)
        }
        return "Ride the bike"
    }
}

let objBike = Bike()

do {
    try objBike.rideBike(age: 15)
    //try objBike.startPicnic(petrolQuantity: 2)
} catch BikeError.inSufficientPetrolQuantity(let neededPetrolQuantity) {
    debugPrint("Required Petrol Quantity: \(neededPetrolQuantity)")
} catch BikeError.inSufficientAge(let neededAge) {
    debugPrint("Required Age: \(neededAge)")
}

