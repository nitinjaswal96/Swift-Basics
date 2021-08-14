import UIKit

struct ComplexTask {
    static var firstElement: Int = 1
    static var result: Int = 0
    
    static func doComplexTask() -> Int {
        var task:[Int] = []
        for i in firstElement...5000{
            task.append(i)
        }
        result = task.first!
        return result
    }
}

struct Employee {
    //lazy property
    lazy var complexTask: Int = ComplexTask.doComplexTask()
    //computed property
    // var complexTask: Int { ComplexTask.doComplexTask() }
}

var objEmployee = Employee()
debugPrint(objEmployee.complexTask)
ComplexTask.firstElement = 100
debugPrint(objEmployee.complexTask)
/// Note: this is the drawback of lazy property the value can be assign only one time. Also lazy property is not thread safe
