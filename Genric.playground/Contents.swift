import UIKit

func increment_int_value_by_one(number: Int) -> Int {
    return number + 1
}

func increment_double_value_by_one(number: Double) -> Double {
    return number + 1
}

increment_int_value_by_one(number: 3)
increment_double_value_by_one(number: 3.0)

func genricAdd<T: Strideable>(number: T) -> T {
    return number.advanced(by: 1)
}

genricAdd(number: 3)
genricAdd(number: 3.0)
