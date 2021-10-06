import UIKit

// Subscript is a shortcut for accessing the member elements of a collection, list, or sequence .

struct Classroom {
    var students = [["Sam", "John", "Bella", "Steve"], ["Sabrina", "Dave", "Charlie"]]
    
    subscript(row: Int, col: Int) -> String {
        get {
            return students[row][col]
        }
        set {
            students[row][col] = newValue
        }
    }
}

var clas = Classroom()
clas[1, 0]
clas[0, 0]
clas[0, 0] = "Mahesh"
clas[0, 0]
