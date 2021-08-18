import UIKit
// https://www.youtube.com/watch?v=ZP4pEHtndFE
// Closures
// What are Closures
// When to use Closures
// How to use Closures

// 1. typealias with closures
typealias AddTwoNumberClosure = (Int, Int) -> Int
var additionOfTwoNumbers: AddTwoNumberClosure = {
    (num1, num2) in
    
    return num1 + num2
}

let result = additionOfTwoNumbers(10, 30)
print(result)


// 2. function call sequence with closure
func printGoodMorningMessage(isMorning: Bool, name: (String) -> String) {
    debugPrint("printGoodMorningMessage")
    if isMorning {
        debugPrint("Good morning \(name("Ravi"))")
    }
}

func assignName(name: String) -> String {
    debugPrint("assignName is called")
    return name
}

printGoodMorningMessage(isMorning: true) { (str: String) in
    return assignName(name: str)
}


// 3. autoclosure
func printGoodMorningMsg(isMorning: Bool, name: @autoclosure () -> String) {
    debugPrint("printGoodMorningMessage")
    if isMorning {
        debugPrint("Good morning \(name())")
    }
}

func assignNam(name: String) -> String {
    debugPrint("assignName is called")
    return name
}

printGoodMorningMsg(isMorning: true, name: assignName(name: "Ravi"))


// 4. escaping and non-escapings
func printGoodMorningMessageEs(isMorning: Bool, name: @escaping ((String) -> String)) {
    debugPrint("printGoodMorningMessage")
    if isMorning {
        sleep(20)
        for i in 0..<100000  {
            let sum = i*3
        }
        debugPrint("Good morning \(name("Ravi"))")
    }
}

func assignNameEs() {
    debugPrint("assignNameEs is started")
    printGoodMorningMessageEs(isMorning: true) { (str: String) in
        debugPrint("closure is called")
        return str
    }
    debugPrint("assignNameEs is ended")
}

assignNameEs()

