import UIKit


let dispatchGroup = DispatchGroup()

dispatchGroup.enter()
for i in 0..<100{ // call API1
    if i==999 {
        dispatchGroup.leave()
    }
    debugPrint("task1:",i)
}

dispatchGroup.enter()
for i in 0..<100{ // call API2
    if i==999 {
        dispatchGroup.leave()
    }
    debugPrint("task2:",i)
}

dispatchGroup.notify(queue: .main) {
    debugPrint("Completed")
}
