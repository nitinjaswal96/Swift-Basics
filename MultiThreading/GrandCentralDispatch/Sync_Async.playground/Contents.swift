import UIKit

/**
 Difference between sync and async:
  Sync, waits for the block of code to finish before returning to main thread
  Async, don't waits.
 
 */

let queue = DispatchQueue(label: "_myqueue")
//queue.sync {
//    for i in 100..<110 {
//        print("Ⓜ️", i)
//    }
//}
queue.async {
    for i in 100..<110 {
        print("Ⓜ️", i)
    }
}

for i in 100..<110 {
    print("¥", i)
}

