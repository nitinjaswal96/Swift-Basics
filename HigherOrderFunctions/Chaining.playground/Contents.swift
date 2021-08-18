import UIKit

struct Car {
    let name: String
    let horsepower: Int
    let price: Int
}

var cars = [Car?]()
cars.append(Car(name: "Porsche 718", horsepower: 310, price: 60500))
cars.append(Car(name: "Porsche 911", horsepower: 400, price: 101500))
cars.append(nil)
cars.append(Car(name: "Porsche Taycan", horsepower: 402, price: 89920))
cars.append(Car(name: "Porsche Panamera", horsepower: 325, price: 63225))
cars.append(nil)
cars.append(nil)
cars.append(Car(name: "Porsche Macan", horsepower: 248, price: 52100))
cars.append(Car(name: "Porsche Cayenne", horsepower: 335, price: 67500))

// Chaining
cars.compactMap{ $0 }.filter{ $0.horsepower > 300 }.sorted{ $0.price > $1.price }.forEach{ print($0) }
