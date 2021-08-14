import UIKit

protocol Equipment {
    func start()
    func stop()
}

protocol ElectricEquipment: Equipment {
    var voltage: Int? {get set}
}

protocol WaterEquipment: Equipment {
    var voltage: Int? {get set}
    var waterLevel: Int? {get set}
}

class Microwave: ElectricEquipment {
    var voltage: Int?
    
    init?(_voltage: Int) {
        guard 50...100 ~= _voltage else {
            debugPrint("Required voltage is not in the range of 50 to 100")
            return nil
        }
        
        voltage = _voltage
    }
    
    func start() {
        debugPrint("Microwave is started")
    }
    
    func stop() {
        debugPrint("Microwave is stopped")
    }
}

class Dishwasher: WaterEquipment {
    var voltage: Int?
    var waterLevel: Int?
    
    init?(_voltage: Int, _waterLevel: Int) {
        guard 200...220 ~= _voltage else {
            debugPrint("Required voltage is not in the range of 200 to 220")
            return nil
        }
        
        guard 3...5 ~= _waterLevel else {
            debugPrint("Required waterlevel is not in the range of 3 to 5")
            return nil
        }
        
        voltage = _voltage
        waterLevel = _waterLevel
    }
    
    func start() {
        debugPrint("Microwave is stopped")
    }
    
    func stop() {
        debugPrint("Microwave is stopped")
    }
}

let objDish = Dishwasher(_voltage: 210, _waterLevel: 4)
objDish?.start()
