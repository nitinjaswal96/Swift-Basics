import UIKit

// 1. failable init method
struct Person {
    var uidai: String
    
    init?(personUidaiNumber: String) {
        guard(personUidaiNumber.count >= 12) else {
            return nil
        }
        uidai = personUidaiNumber
    }
}

let objPerson = Person(personUidaiNumber: "Code")
print(objPerson?.uidai ?? "invalid")


// 2. convenience init method
class Cake{
    
    var quanity: Int
    var name: String
    
    init(cakeQuantity: Int, cakeName: String) { // designeted init
        self.name = cakeName
        self.quanity = cakeQuantity
    }
    
    convenience init(_cakeName: String) {
        self.init(cakeQuantity: 1, cakeName: _cakeName)
    }
    
    convenience init() {
        self.init(cakeQuantity: 1, cakeName: "Hello Guys")
    }
}

var objCake = Cake()
objCake.name
