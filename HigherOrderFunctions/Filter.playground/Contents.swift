import UIKit

let numberArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

let filterEvenData = numberArray.filter{ $0 % 2 == 0 }
print("Even Values", filterEvenData)

