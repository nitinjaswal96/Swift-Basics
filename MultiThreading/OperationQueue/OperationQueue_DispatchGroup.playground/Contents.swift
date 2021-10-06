import UIKit

struct SyncResource
{
    func syncDataResources()
    {

        let group = DispatchGroup()

        // employee block operation
        let employeeBlockOperation = BlockOperation()
        employeeBlockOperation.addExecutionBlock {
            group.enter()
            let employeeDataResource = EmployeeDataResource()
            employeeDataResource.getEmployee { (employeeData) in
                employeeData?.forEach({ (employee) in
                    debugPrint(employee.name)
                })
                group.leave()
            }
            
            group.wait()
        }

        // project block operation
        let projectBlockOperation = BlockOperation()
        projectBlockOperation.addExecutionBlock {
            group.enter()
            let projectResource = ProjectDataResource()
            projectResource.getProject { (projectData) in
                projectData?.forEach({ (project) in
                    debugPrint(project.name)
                })
                group.leave()
            }

            group.wait()
        }

        // adding dependency
        employeeBlockOperation.addDependency(projectBlockOperation)

        // creating the operation queue
        let operationQueue = OperationQueue()
        operationQueue.addOperation(employeeBlockOperation)
        operationQueue.addOperation(projectBlockOperation)
    }
}



// MARK: - Employee
struct EmployeeDataResource
{
    func getEmployee(handler:@escaping(_ result: [EmployeeData]?)-> Void)
    {
        debugPrint("inside the get employee function")

        var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Employee/GetEmployee?Department=mobile&UserId=15")!)
        urlRequest.httpMethod = "get"
        debugPrint("going to call the http utility for employee request")

        HttpUtility.shared.getData(request: urlRequest, response: EmployeeResponse.self) { (result) in
            if(result != nil) {
                debugPrint("got the emloyee response from api")
                handler(result?.data)
            }
        }
    }
}


struct ProjectDataResource
{
    func getProject(handler:@escaping(_ result: [Project]?)-> Void)
    {
        debugPrint("inside the get project function")

        var urlRequest = URLRequest(url: URL(string: "https://api-dev-scus-demo.azurewebsites.net/api/Project/GetProjects")!)
        urlRequest.httpMethod = "get"

        debugPrint("going to call the http utility for Project request")

        HttpUtility.shared.getData(request: urlRequest, response: [Project].self) { (result) in
            if(result != nil) {
                debugPrint("got the project response from api")
                handler(result)
            }
        }
    }
}

// MARK: - HttpUtility
struct HttpUtility
{
    static let shared = HttpUtility()
    private init(){}
    func getData<T:Decodable>(request: URLRequest, response: T.Type, handler:@escaping(_ result: T?)-> Void)
    {
        URLSession.shared.dataTask(with: request) { (data, httpUrlResponse, error) in
            if(error == nil && data != nil && data?.count != 0) {
                do {
                   let decoder = JSONDecoder()
                    // for date formatting
                    decoder.dateDecodingStrategy = .iso8601
                    let result = try decoder.decode(response, from: data!)
                    handler(result)
                } catch  {
                    debugPrint(error.localizedDescription)
                }

            }}.resume()
    }
}


struct Project: Decodable {
    let id: Int
    let name, description: String
    let isActive: Bool
    let startDate: Date
    let endDate: Date?

    enum CodingKeys: String, CodingKey {
        case id
        case name,description
        case isActive, startDate, endDate
    }
}


// MARK: - EmployeeResponse
struct EmployeeResponse: Decodable {
    let errorMessage: String?
    let data: [EmployeeData]?
}

// MARK: - EmployeeData
struct EmployeeData: Decodable {
    let name, email, id,joining: String
}

let syncResource = SyncResource()
syncResource.syncDataResources()
