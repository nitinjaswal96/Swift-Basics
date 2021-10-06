import UIKit

protocol Banking {
    func withDrawAmount(amount: Double) throws
    func printMaessage()
}

enum WithdrawalError: Error {
    case inSufficientAccountBalance
}

var accountBalance: Double = 30000.00

struct Atm: Banking {
    func withDrawAmount(amount: Double) throws {
        debugPrint("inside atm")
        
        guard accountBalance > amount else {
            throw WithdrawalError.inSufficientAccountBalance
        }
        
        //
        Thread.sleep(forTimeInterval: Double.random(in: 1...3))
        accountBalance -= amount
    }
    
    func printMaessage() {
        debugPrint("ATM withdrawal successful, new account balance = \(accountBalance)")
    }
}
struct Bank: Banking {
    func withDrawAmount(amount: Double) throws {
        debugPrint("inside bank")
        
        guard accountBalance > amount else {
            throw WithdrawalError.inSufficientAccountBalance
        }
        
        //
        Thread.sleep(forTimeInterval: Double.random(in: 1...3))
        accountBalance -= amount
    }
    
    func printMaessage() {
        debugPrint("Bank withdrawal successful, new account balance = \(accountBalance)")
    }
}

let queue = DispatchQueue(label: "com._.myQueue", qos: .utility, attributes: .concurrent)
let semaphore = DispatchSemaphore(value: 1)

queue.async {
    // Money withdrawl from ATM
    do{
        semaphore.wait()
        let atm = Atm()
        try atm.withDrawAmount(amount: 10000)
        atm.printMaessage()
        semaphore.signal()
    } catch WithdrawalError.inSufficientAccountBalance {
        semaphore.signal()
        debugPrint("ATM withdrawal failure: The account balance is less than the amount you want to withdraw, transaction cancelled")
    } catch {
        semaphore.signal()
        debugPrint("Error")
    }
}

queue.async {
    // Money withdrawl from Bank
    do{
        semaphore.wait()
        let atm = Bank()
        try atm.withDrawAmount(amount: 25000)
        atm.printMaessage()
        semaphore.signal()
    } catch WithdrawalError.inSufficientAccountBalance {
        semaphore.signal()
        debugPrint("Bank withdrawal failure: The account balance is less than the amount you want to withdraw, transaction cancelled")
    } catch {
        semaphore.signal()
        debugPrint("Error")
    }
}
