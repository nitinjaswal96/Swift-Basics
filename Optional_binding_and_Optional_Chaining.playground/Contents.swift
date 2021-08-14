import UIKit

// optional binding and optional chanining

struct Parts {
    let name: String?
    let price: Double?
}

class ComputerParts {
    func findParts(name: String) -> Parts? {
        if name == "keyboard" {
            return Parts(name: "some keyboard", price: 800)
        } else if name == "mouse" {
            return Parts(name: "some mouse", price: 400)
        }
        return nil
    }
}

let objComputerParts = ComputerParts()

// optional binding
if let parts = objComputerParts.findParts(name: "graphic card") {
    if let partPrice = parts.price {
        debugPrint(partPrice) // do tax calc
    }
}

// optional chanining
if let partPrice = objComputerParts.findParts(name: "graphic card")?.price {
    debugPrint(partPrice) // do tax calc
}
