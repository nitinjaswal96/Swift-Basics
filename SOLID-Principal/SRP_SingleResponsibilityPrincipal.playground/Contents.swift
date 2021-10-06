import UIKit

// [SRP] through single responsibility principal we can divide the job responsibilty from one class to seprate classes

struct EmployeeModel {
    let Id: Int
    let name: String
    let address: String
}

protocol abc {
    // func 1
    // func 2
}

class HttpHandler {
    func getDataFromApi() -> Data {
        return Data()
    }
    
    func getDataFromWebService<T: Codable>(url: URL, resultType: T.Type, completionHandler: @escaping(_ result: T?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, URLResponse, error) in
            do{
                let result = try JSONDecoder().decode(T.self, from: data!)
                completionHandler(result)
            } catch {
                debugPrint("error occured while decoding")
            }
        }.resume()
    }
}

class Parser {
    func parserApiResponse(data: Data) -> Array<EmployeeModel> {
        return Array<EmployeeModel>()
    }
}

class DatabaseHandler {
    func saveDataToDatabase(data: Array<EmployeeModel>) {
        // code to save data to database
    }
}

class SaveViaApi {
    
}

class Employee {
    let _httpHandler: HttpHandler
    let _parser: Parser
    let _databaseHandler: DatabaseHandler
    let _obj: SaveViaApi
    
    init(httpHandler: HttpHandler, parser: Parser, databaseHandler: DatabaseHandler, obj: SaveViaApi) {
        _httpHandler = httpHandler
        _parser = parser
        _databaseHandler = databaseHandler
        _obj = obj
    }
    
    func getEmployeeData() -> Void {
        let employeeResponse = _httpHandler.getDataFromApi()
        let employeeDataArray = _parser.parserApiResponse(data: employeeResponse)
        _databaseHandler.saveDataToDatabase(data: employeeDataArray)
    }
}

let objEmployee = Employee(httpHandler: HttpHandler(), parser: Parser(), databaseHandler: DatabaseHandler())
objEmployee.getEmployeeData()
