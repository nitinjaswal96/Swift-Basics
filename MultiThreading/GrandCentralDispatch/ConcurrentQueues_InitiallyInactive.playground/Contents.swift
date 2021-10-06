import UIKit

// Attributes: Concurrent Queue: In concurrent_queue all operation tasks will be executed all together.
//////////////////////////////////////////////////Example 1/////////////////////////////////////////////////////////////////////////////////

var accountBalance: Int = 4000
let lock = NSLock()

struct Bank {
    let withdrawMethod: String

    func doTransaction(amount: Int) {
        lock.lock()
        // check the account balance before you begin the transaction process
        if accountBalance > amount {
            debugPrint("\(self.withdrawMethod): Balance is sufficient. proceed with transaction")

            // added thread sleep to simulate a long process
            Thread.sleep(forTimeInterval: Double.random(in: 0...4))
            //deduct the account balance
            accountBalance -= amount
            debugPrint("\(self.withdrawMethod): Done: \(amount) has been withdrawed")
            debugPrint("\(self.withdrawMethod): Current balance is: \(accountBalance)")
        } else {
            debugPrint("\(self.withdrawMethod): Can't withdraw: insufficient balance")
        }

        lock.unlock()
    }
}

let queue = DispatchQueue(label: "WidthrawalQueue",  attributes: .concurrent)
queue.async {
    let netbankingInterface = Bank(withdrawMethod: "Netbanking interface")
    netbankingInterface.doTransaction(amount: 3000)
}

queue.async {
    let bankAtm = Bank(withdrawMethod: "Bank ATM")
    bankAtm.doTransaction(amount: 4000)
}

//////////////////////////////////////////////////Example 2/////////////////////////////////////////////////////////////////////////////////
let anotherQueue = DispatchQueue(label: "com._.anotherQueue", qos: .utility, attributes: .concurrent)

anotherQueue.async {
    for i in 0..<10 {
        print("•", i)
    }
}

anotherQueue.async {
    for i in 0..<10 {
        print("ç", i)
    }
}

anotherQueue.async {
    for i in 0..<10 {
        print("∑", i)
    }
}

// Attributes: InitiallyInactive Queue: the execution of the tasks doesn’t start automatically, instead the developer has to trigger the execution.
var inactiveQueue: DispatchQueue!
func queueFunc() {
    let anotherQueue = DispatchQueue(label: "com_anotherQueue", qos: .utility, attributes: [.initiallyInactive, .concurrent])
    inactiveQueue = anotherQueue

    anotherQueue.async {
        for i in 0..<10 {
            print("•", i)
        }
    }

    anotherQueue.async {
        for i in 0..<10 {
            print("ç", i)
        }
    }

    anotherQueue.async {
        for i in 0..<10 {
            print("∑", i)
        }
    }

}

queueFunc()

if let queue = inactiveQueue {
    queue.activate()
}


// Combination of Concurrent Queue and Initially Inactive Queue
var inactiveQueue1: DispatchQueue!
func queueFunc1() {
    let anotherQueue = DispatchQueue(label: "com_anotherQueue", qos: .utility, attributes: [.initiallyInactive, .concurrent])
    inactiveQueue1 = anotherQueue
    
    anotherQueue.async {
        for i in 0..<10 {
            print("•", i)
        }
    }

    anotherQueue.async {
        for i in 0..<10 {
            print("ç", i)
        }
    }

    anotherQueue.async {
        for i in 0..<10 {
            print("∑", i)
        }
    }
}

queueFunc1()

if let queue = inactiveQueue1 {
    queue.activate()
}
