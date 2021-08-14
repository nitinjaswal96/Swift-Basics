import UIKit

class Bank {
    var accountBalance : Double {
        didSet {
            sendMessageToUser()
        }
        willSet(newAccountBalance) {
            sendMessageToAuditor(_accountBalance: newAccountBalance)
        }
    }
    
    init(_openingBalance: Double) {
        accountBalance = _openingBalance
    }
    
    func addMoney(amount: Double) {
        accountBalance += amount
    }
    
    func withDrawMoney(amount: Double) {
        accountBalance -= amount
    }
    
    func sendMessageToUser() {
        debugPrint("Account balance updated new balance = \(accountBalance)")
    }

    func sendMessageToAuditor(_accountBalance: Double) {
        debugPrint("Please check this account, and make sure the transaction is authentic for amount = \(_accountBalance)")
    }
}

let bankObj = Bank(_openingBalance: 10000)
bankObj.addMoney(amount: 50000000)


struct PostOffice {
    var accountBalance : Double {
        didSet {
            sendMessageToUser()
        }
        willSet(newAccountBalance) {
            sendMessageToAuditor(_accountBalance: newAccountBalance)
        }
    }
    
    init(_openingBalance: Double) {
        accountBalance = _openingBalance
    }
    
    mutating func addMoney(amount: Double) {
        accountBalance += amount
    }
    
    mutating func withDrawMoney(amount: Double) {
        accountBalance -= amount
    }
    
    func sendMessageToUser() {
        debugPrint("Account balance updated new balance = \(accountBalance)")
    }

    func sendMessageToAuditor(_accountBalance: Double) {
        debugPrint("Please check this account, and make sure the transaction is authentic for amount = \(_accountBalance)")
    }
}

var postOfficeObj = PostOffice(_openingBalance: 10000)
postOfficeObj.addMoney(amount: 50000000)
