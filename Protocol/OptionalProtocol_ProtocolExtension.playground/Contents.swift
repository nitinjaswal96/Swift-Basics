import UIKit

// 1. Optional Protocol
@objc protocol Taxable {
    func calculateTax()
    @objc optional func printTaxInfo()
}

class Invoice: Taxable {
    func calculateTax() {
        debugPrint("Calculate invoice tax")
    }
}

let objInClass = Invoice()
objInClass.calculateTax()


// 2. Protocol Extension
protocol NonTaxable {
    func calculateTax()
}

class Deposit: NonTaxable {
    func calculateTax() {
        debugPrint("Calculate invoice tax")
    }
}

extension NonTaxable {
    func printTaxInfo() {
        debugPrint("Print tax info")
    }
}

let objDepClass = Deposit()
objDepClass.calculateTax()
