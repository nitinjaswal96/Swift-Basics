import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

struct Endpoints {
    static let getEvents = "http://demo0333988.mockable.io/getEvents"
}

class HttpClient {
    
    func getData(url: URL, completionHandler: @escaping(_ data: Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { (dataResponse, urlResponse, error) in
            completionHandler(dataResponse)
            PlaygroundPage.current.finishExecution()
        }.resume()
    }
    
}

class Events {
    var client: HttpClient? = nil
    
    init(_client: HttpClient) {
        client = _client
    }
    
    func getEventsRecords() {
        client?.getData(url: URL(string: Endpoints.getEvents)!) { (resposeData) in
            if resposeData?.count != 0 {
                // process the response here
                debugPrint("response data = \(String(describing: resposeData?.count))")
                
            }
            
        }
    }
    
}

let objEW = Events(_client: HttpClient())
//objEW.client = HttpClient()
objEW.getEventsRecords()
