import UIKit

protocol Product {
    associatedtype Code
    var productCode: Code {get}
    func description() -> String
}

struct Laptop: Product {
    typealias Code = String
    var productCode: Code
    
    func description() -> String {
        "This is a Laptop"
    }
}

struct Keyboard: Product {
    typealias Code = Int
    var productCode: Code
    
    func description() -> String {
        "This is a Keyboard"
    }
}

struct Factory {
    // since the return type Product has a variable of associatedtype we need apply "some" keyword (which ensures that a selected type will be returned)
    // which states that its hidden during the declaration
    func makeProducts() -> some Product {
        return Laptop(productCode: "test")
    }
    
    func makeProducts() -> Laptop {
        return Laptop(productCode: "test")
    }
    
    func makeProducts() -> Keyboard {
        return Keyboard(productCode: 1)
    }
}
