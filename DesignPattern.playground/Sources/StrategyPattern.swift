import Foundation

// 商场收银软件: 用两个文本框输入单价和数量, 一个确定按钮来计算出每种商品的费用, 之后增加打折, 和返利策略

// 策略模式: 是用来封装算法的, 但在实践中, 只有在分析过程中听到需要在不同时间应用不同的业务规则, 就可以考虑使用策略模式处理这种变化的可能性.

public protocol CashSuper {
    
    func acceptCash(money: Float) -> Float
    
}

// 正常收费
public class CashNormal: NSObject, CashSuper {
    
    public func acceptCash(money: Float) -> Float {
        return money
    }
}


/// 打折
public class CashRebate: NSObject, CashSuper {
    
    private var moneyRebate: Float = 1;
    
    public init(WithRebate moneyRebate: Float) {
        self.moneyRebate = moneyRebate
    }
    
    public func acceptCash(money: Float) -> Float {
        return money * moneyRebate
    }
}


/// 满减
public class CashReturn: NSObject, CashSuper {
    
    private var moneyCondition: Float = 0;
    private var moneyReturn: Float = 0;
    
    
    public init(WithMoneyCondition moneyCondition: Float, moneyReturn: Float) {
        self.moneyCondition = moneyCondition
        self.moneyReturn = moneyReturn
    }
    
    
    public func acceptCash(money: Float) -> Float {
        var result = money
        if money >= moneyCondition {
            result = money - floor(money/moneyCondition) * moneyReturn
        }
        return result
    }
}



public class CashContext: NSObject {
    
    private var cs: CashSuper?
    
    
    public init(WithCashSupern cashSuper: CashSuper) {
        self.cs = cashSuper
    }
    
    public func getResult(money: Float) -> Float{
       return cs?.acceptCash(money: money) ?? 0
    }
    
}





/// 策略与简单工厂结合
public class CashContextFactory: NSObject {
    
    private var cs: CashSuper?
    
    
    public init(WithStringType type: String) {
        switch type {
        case "正常收费":
            cs = CashNormal()
            break
        case "满300减100":
            cs = CashReturn(WithMoneyCondition: 300, moneyReturn: 100)
            break
        case "打8折":
            cs = CashRebate(WithRebate: 0.8)
            break
        default:
            break
        }
    }
    
    public func getResult(money: Float) -> Float{
       return cs?.acceptCash(money: money) ?? 0
    }
    
}



/// 策略模式
/// - Parameters:
///   - type: 算法类型
///   - money: 原价
/// - Returns: 实际价格
func strategyPattern(type: Int, money: Float) -> Float {
    let cashType = ["正常收费", "满300返100", "打8折"]
    var cc: CashContext?
    let inputType = type > 2 ? 0 : type
    switch cashType[inputType] {
    case "正常收费":
        let normalStrategy = CashNormal()
        cc = CashContext.init(WithCashSupern: normalStrategy)
        break
    case "满300返100":
        let returnStrategy = CashReturn(WithMoneyCondition: 300, moneyReturn: 100)
        cc = CashContext.init(WithCashSupern: returnStrategy)
        break
    case "打8折":
        let rateStrategy = CashRebate(WithRebate: 0.8)
        cc = CashContext.init(WithCashSupern: rateStrategy)
        break
    default:
        break
    }
    return  cc?.getResult(money: money) ?? 0
}
