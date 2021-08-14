import UIKit

/**
  Dependency Inversion Principle:
 High level modules should not depend upon low level modules. Both should depend upon abstractions.
 Abstractions should not depend upon details. Details should depend upon abstractions.
 
  Note: -
 The code is bad designed when they have:
 Rigidity: It’s hard to change it, because possible changes affects this software’s others parts.
 Fragility: It’s difficult to implement modifications, because possible changes breaks this software’s others parts.
 Immobility or Coupling: It’s really difficult to reuse or extract some piece of code because everything is totally coupled, and if you need to do it, probably you’ll have to perform a huge refactor.
 */

struct Order
{
    let amount: Double
    let description: String
    let tax: Double
    let created_by: String
}

protocol OrderStorage
{
    func saveOrder(order: Order)
}

// high-level class
class Handler
{
    private let _orderStorage: OrderStorage
    
    // loose coupled
    init(storage: OrderStorage) {
        _orderStorage = storage
    }
    
    func saveOrderData(order: Order) {
        guard order.amount != 0 else {
            debugPrint("Save operation FAILED, Order amount should be greater than 0")
            return
        }
        // save orders to database/api
        _orderStorage.saveOrder(order: order)
    }
}

// low-level class
class OrderDatabaseOperations: OrderStorage
{
    func saveOrder(order: Order) {
        // save orders to databse
        debugPrint("Order: \(order.description) of amount \(order.amount) was saved")
    }
}

// low-level class
class OrderAPIOperations: OrderStorage
{
    func saveOrder(order: Order) {
        // save orders via API
        debugPrint("Order: \(order.description) of amount \(order.amount) was saved")
    }
}

let objHandler = Handler(storage: OrderDatabaseOperations())
// let objHandler = Handler(storage: OrderAPIOperations())
objHandler.saveOrderData(order: Order(amount: 300, description: "order description", tax: 2, created_by: "nitin"))
