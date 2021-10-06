import UIKit

DispatchQueue.global(qos: .default).async {
    
    print("This is run on a background queue")
    DispatchQueue.main.async {
        print("This is run on a main queue")
    }
}
