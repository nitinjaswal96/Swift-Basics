import UIKit

class Person {
    var name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    var gadget: Gadget?
    deinit {
        print("\(name) is being deinitialized")
    }
}
 
class Gadget {
    var model: String
    unowned var owner: Person
    init(model: String, owner: Person) {
        self.model = model
        self.owner = owner
        print("\(model) is being initialized")
    }
    
    deinit {
        print("\(model) is being deinitialized")
    }
    
}

var kelvin: Person?
var iphone: Gadget?
 
kelvin = Person(name: "Kelvin")
iphone = Gadget(model: "iPhone 8 Plus", owner: kelvin!)

kelvin!.gadget = iphone

kelvin = nil
iphone = nil




