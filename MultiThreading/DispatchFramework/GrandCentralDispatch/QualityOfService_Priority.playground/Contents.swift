import UIKit

/**
 The following list summarises the available QoS cases, also called QoS classes. The first class means the highest priority, the last one the lowest priority:
- userInteractive
- userInitiated
- default
- utility
- background
- unspecified
 */
// higher priority queue will execute faster...
let queue1 = DispatchQueue(label: "com.appcoda.queue1", qos: .userInitiated)
let queue2 = DispatchQueue(label: "com.appcoda.queue2", qos: .utility)

queue1.async {
    for i in 0..<10 {
        print("•", i)
    }
}

queue2.async {
    for i in 0..<10 {
        print("£", i)
    }
}
