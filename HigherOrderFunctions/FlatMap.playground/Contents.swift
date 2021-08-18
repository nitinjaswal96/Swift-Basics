import UIKit

var arrayFlat = [[11,12,13], [14,15,16]]
var mapArr: [Int] = []
for arr in arrayFlat {
    mapArr += arr
}
print("maparr", mapArr)

// FlatMap
let f1 = arrayFlat.flatMap{$0}
print("f1", f1)
