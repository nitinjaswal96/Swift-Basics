import UIKit

let numberArray = [1, 2, 3, 4, 5]

// Method 1:-
let m1 = numberArray.map{(value: Int) -> Int in
    return value * 2
}
print("Array", m1)

// Method 2:-
let m2 = numberArray.map{(value: Int) in
    return value * 2
}
print("Array", m2)

// Method 3:-
let m3 = numberArray.map{(value) in
    return value * 2
}
print("Array", m3)

// Method 4:-
let m4 = numberArray.map{ $0 * 2 }
print("Array", m4)


