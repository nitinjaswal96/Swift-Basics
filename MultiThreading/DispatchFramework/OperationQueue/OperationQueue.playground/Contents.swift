import UIKit

var queue = OperationQueue()
let operation1 = BlockOperation(block: {
    OperationQueue.main.addOperation({
        print("Operation 1 perform")
        for i in 1..<10 {
            debugPrint("\(i)")
            sleep(1)
        }
    })
})
operation1.completionBlock = {
    print("Operation 1 completed")
}
queue.addOperation(operation1)

let operation2 = BlockOperation(block: {
    OperationQueue.main.addOperation({
        print("Operation 2 perform")
        for i in 1..<10 {
            debugPrint("\(i)")
            sleep(1)
        }
    })
})
operation2.completionBlock = {
    print("Operation 2 completed")
}
operation2.addDependency(operation1)
queue.addOperation(operation2)

let operation3 = BlockOperation(block: {
    OperationQueue.main.addOperation({
        print("Operation 3 perform")
        for i in 1..<10 {
            debugPrint("\(i)")
            sleep(1)
        }
    })
})
operation3.completionBlock = {
    print("Operation 3 completed")
}
operation3.addDependency(operation2)
queue.addOperation(operation3)
