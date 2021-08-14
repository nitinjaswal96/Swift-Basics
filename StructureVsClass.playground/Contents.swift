import UIKit

/**
 Similarities:
 - Define properties to store values
 - Define methods to provide functionality
 - Define subscripts to provide access to their values using subscript syntax
 - Define initializers to set up their initial state
 - Be extended to expand their functionality beyond a default implementation
 - Conform to protocols to provide standard functionality of a certain kind
 
 Additional capabilities of class over struct:
 - Inheritance enables one class to inherit the characteristics of another.
 - Type casting enables you to check and interpret the type of a class instance at runtime.
 - Deinitializers enable an instance of a class to free up any resources it has assigned.
 - Reference counting allows more than one reference to a class instance.
 */

// Structures are value type and  Classes are reference type
struct Person {
    var id = Int()
    var name = String()
    
}

var objPerson1 = Person(id: 12, name: "Sam")
var objPerson2 = objPerson1

objPerson2.id = 20

debugPrint(objPerson1)
debugPrint(objPerson2)

//
class Company {
    var rank: Int = 2
    var name: String = "Dell"
}

var objCompany1 = Company()
var objCompany2 = objCompany1

objCompany2.rank = 20

debugPrint(objCompany1.rank)
debugPrint(objCompany2.rank)


