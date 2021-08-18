import UIKit

let delayQueue = DispatchQueue(label: "com._.delayqueue", qos: .userInitiated)
print(Date())
 
let additionalTime: DispatchTimeInterval = .seconds(2)
delayQueue.asyncAfter(deadline: .now() + additionalTime) {
    print(Date())
}
