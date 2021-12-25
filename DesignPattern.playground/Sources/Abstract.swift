import Foundation

public protocol IUser {
    func insert(u: User)
    func getUser(id: Int) -> User?
}




public protocol IDepartment {
    
    func insert(d: Department)
    func getDepartment(id: Int) -> Department?
}


public class Department {
    
    public var id: Int = 0
    public var deptName: String = ""
    
    public init() {
        
    }
}


public class User {
    
    public var id: Int = 0
    public var name: String = ""
    
    public init() {
        
    }
}


public class SqlUser: IUser {
    public func insert(u d: User) {
        print("在 SQL  中薪资一条USER记录")
    }
    
    public func getUser(id: Int) -> User? {
        print("在 SQL  中根据ID:得到一条USER记录")
        return nil
    }
    
    
}

public class AccessUser: IUser {
    public func insert(u: User) {
        print("在 ACCESS  中薪资一条USER记录")
    }
    
    public func getUser(id: Int) -> User? {
        print("在 ACCESS  中根据ID:得到一条USER记录")
        return nil
    }
    
    
}

public class SqlDepartment: IDepartment {
    public func insert(d: Department) {
        print("在 ACCESS  中薪资一条SqlDepartment记录")
    }
    
    public func getDepartment(id: Int) -> Department? {
        print("在 ACCESS  中根据ID:得到一条SqlDepartment记录")
        return nil
    }
    
    
}

public class AccessDepartment: IDepartment {
    public func insert(d: Department) {
        print("在 ACCESS  中薪资一条AccessDepartment记录")
    }
    
    public func getDepartment(id: Int) -> Department? {
        print("在 ACCESS  中根据ID:得到一条AccessDepartment记录")
        return nil
    }
    
    
}


public class DataAccess  {
    
    static var db: String = "sql"
    
    public init() {
        
    }
    
    public static func createUser() -> IUser {
        switch db {
        case "sql":
            return SqlUser()
        default:
            return AccessUser()
        }
    }
    
    
    public static func createDepartment() -> IDepartment {
        switch db {
        case "sql":
            return SqlDepartment()
        default:
            return AccessDepartment()
        }
    }
}
