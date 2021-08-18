import UIKit

/**
 Benifits: It genralises the class for accessing the common methods
 Drawback: different classes will be requiring specific methods only but singelton provides the acess to all methods. which troubles this heavy class to maintain.
 */

struct UserInfo {
    var firstName: String?
    var lastName: String?
}

var objUserInfo: UserInfo?

class Singleton {
    static let shared = Singleton()
    private init(){}
    
    func getUserInfo() -> UserInfo? {
        return objUserInfo
    }
    
    func updateUserInfo(updateUserInfo: UserInfo) {
        objUserInfo = updateUserInfo
    }
}

class UserManager {
    func getUser() -> UserInfo? {
        return Singleton.shared.getUserInfo()
    }
    
    func updateUserInfo(updateuserInfo: UserInfo) {
        return Singleton.shared.updateUserInfo(updateUserInfo: updateuserInfo)
    }
}

let objUserManager = UserManager()
objUserManager.updateUserInfo(updateuserInfo: UserInfo(firstName: "Nitin", lastName: "Jaswal"))
print(objUserManager.getUser() as Any)
