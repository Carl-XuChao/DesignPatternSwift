import Foundation


/// 运算基类
public class Operation {
    
    public var a: Float = 0
    public var b: Float = 0
    
    public func getResult() -> Float  {
        let result: Float = 0
        return result
    }
}


/// 加法运算类
public class OperationAdd: Operation {
    
    public override func getResult() -> Float {
        return a + b
    }
}

/// 减法运算类
public class OperationSub: Operation {
    
    public override func getResult() -> Float {
        return a - b
    }
}

/// 乘法运算类
public class OperationMul: Operation {
    
    public override func getResult() -> Float {
        return a * b
    }
}

/// 除法运算类
public class OperationDiv: Operation {
    
    public override func getResult() -> Float {
        if b == 0 {
            return 0
        }
        return a / b
    }
}


/// 简单工厂类
public class OperationFactory {
    
    public static func createOperation(operate: String) -> Operation? {
        var oper: Operation? = nil
        switch operate {
        case "+":
            oper = OperationAdd()
            break
        case "_":
            oper = OperationSub()
            break
        case "*":
            oper = OperationMul()
            break
        case "/":
            oper = OperationDiv()
            break
        default:
            break
        }
        return oper
    }
}



/// 简单工厂方法
func simplyFactoryMethod() {
    let oper = OperationFactory.createOperation(operate: "+")
    oper?.a = 10
    oper?.b = 20
    _ = oper?.getResult()
}
