import UIKit

struct Example {

    func printNumbers() {
        var workItem : DispatchWorkItem?
        workItem = DispatchWorkItem
        {
            for i in 1..<10 {

                guard let wkItem = workItem, !wkItem.isCancelled  else
                {
                    debugPrint("Work item is cancelled")
                    break
                }

                debugPrint("\(i)")
                sleep(1)
            }
        }

        workItem?.notify(queue: .main, execute: {
            debugPrint("done printing numbers")
        })

        let queue = DispatchQueue.global(qos: .utility)
        queue.async(execute: workItem!)

        queue.asyncAfter(deadline: .now() + .seconds(3)) {
            workItem?.cancel()
        }
    }


    func myDispatchWorkItemExample() {
        var sum: Int = 0
        let workItem = DispatchWorkItem{
            sum += 5
        }

        let queue = DispatchQueue(label: "com._.myqueue", qos: .utility)
        queue.async {
            workItem.perform()
        }
        queue.async(execute: workItem)
        workItem.notify(queue: DispatchQueue.main){
            print("Sum=", sum)
        }
    }
}

let obj = Example()
obj.printNumbers()

