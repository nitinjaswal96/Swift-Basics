import UIKit

// Sets
var colorSet: Set<String> = ["Red", "Black", "Green"]
print(colorSet)

var colorOrderSet: NSOrderedSet = ["Red", "Black", "Green", "Green"]
print(colorOrderSet)

var  colosArray: Array<String> = ["Red", "Black", "Green", "Black"]
print(colosArray)


// high-end functions of Set
var teaSet: Set<String> = ["Milk", "Sugar", "Tea powder", "Clove", "Ginger"]
var cofeeSet: Set<String> = ["Milk", "Sugar", "Cofee powder"]
print(teaSet.intersection(cofeeSet))
print(teaSet.symmetricDifference(cofeeSet))

// Note: Hashable is a value of each element in code which is unique
var str1: String = "Swift-Programing"
print(str1.hashValue)
var str2: String = "Swift-Programing"
print(str2.hashValue)

// Struct as Set
struct Person: Hashable {
    let age: Int
    let name: String
}

let objPersonSet: Set<Person> = [Person(age: 20, name: "Jasimen"), Person(age: 31, name: "Rohit")]

for person in objPersonSet {
    print(person)
}

