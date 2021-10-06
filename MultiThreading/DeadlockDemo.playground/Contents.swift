import UIKit


let highPriorityQueue = DispatchQueue.global(qos: .userInitiated)
let lowPriorityQueue = DispatchQueue.global(qos: .utility)

let meSemaphore = DispatchSemaphore(value: 1)
let brotherSemaphore = DispatchSemaphore(value: 1)


func requestForResource(resource: String, prioritySymbol: String, semaphore: DispatchSemaphore)
{
    debugPrint("\(prioritySymbol) is waiting for resource = \(resource)")
    semaphore.wait(timeout: DispatchTime.now() + 5)
}

func prepareBreakfast(queue: DispatchQueue, prioritySymbol: String, firstResource: String, firstSemaphore: DispatchSemaphore, secondResource: String, secondSemaphore: DispatchSemaphore)
{
    queue.async {

        requestForResource(resource: firstResource, prioritySymbol: prioritySymbol, semaphore: firstSemaphore)

        for i in 0...10 {
            if(i == 4)
            {
                requestForResource(resource: secondResource, prioritySymbol: prioritySymbol, semaphore: secondSemaphore)
            }
            debugPrint("\(prioritySymbol) \(i)")
        }

        debugPrint("signal called")
        firstSemaphore.signal()
        secondSemaphore.signal()
    }
}

prepareBreakfast(queue: highPriorityQueue, prioritySymbol: "🐈", firstResource: "Pan", firstSemaphore: meSemaphore, secondResource: "Oil", secondSemaphore: brotherSemaphore)

prepareBreakfast(queue: lowPriorityQueue, prioritySymbol: "🦖", firstResource: "Oil", firstSemaphore: brotherSemaphore, secondResource: "Pan", secondSemaphore: meSemaphore)

