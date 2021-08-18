import UIKit

let people = ["Sam", nil, "Mac", nil, "Ray"]
let p1 = people.compactMap{$0}
print("p1", p1)
