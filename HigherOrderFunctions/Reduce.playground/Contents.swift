import UIKit

let array = [1, 2, 3, 4, 5]
var sum: Int = 0

for num in array {
    sum += num
}
print(sum)

// Reudce
var reduceSum = array.reduce(0, { $0+$1 })
print(reduceSum)

// Reudce
let strArray = ["Hello", "World"]
var reduceString = strArray.reduce("", { $0+$1 })
print(reduceString)
