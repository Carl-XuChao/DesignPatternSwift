import Foundation

/*
 外观模式, 为子系统中的一组接口提供一个一致的界面,此模式定义了一个高层接口,这个接口使得这一子系统更加容易使用.
 外观模式使用时机:
 1.设计初期阶段, 应该要意识的将不同的两个层分离,层与层之间建立外观模式
 2.开发阶段,子系统往往因为不断的重构演化而变得越复杂,增加外观模式可以提供一个简单登记接口减少它们之间的依赖.
 3.在维护一个遗留的大型系统时, 可能这个系统已经非常难以维护和扩展了, 为新系统开发一个外观类, 来提供设计粗糙或高度复杂的遗留代码的比较清晰的接口, 让新系统与外观类交互, 外观类与遗留代码交互所有复杂工作.
 */

public class Stock1 {
    
    public init() {
        
    }
    
    public func sell() {
        print("股票 1 卖出")
    }
    
    public func buy() {
        print("股票 1 买入")
    }
}


public class Stock2 {
    
    public init() {
        
    }
    
    public func sell() {
        print("股票 2 卖出")
    }
    
    public func buy() {
        print("股票 2 买入")
    }
}


public class Stock3 {
    public init() {
        
    }
    
    public func sell() {
        print("股票 3 卖出")
    }
    
    public func buy() {
        print("股票 3 买入")
    }
}

public class NationalDebt1 {
    
    public func sell() {
        print("国债 1 卖出")
    }
    
    public func buy() {
        print("国债 1 买入")
    }
}

public class Realty1 {
    
    public func sell() {
        print("房地产 1 卖出")
    }
    
    public func buy() {
        print("房地产 1 买入")
    }
}




/// 基金
public class Fund {
    
    var stock1: Stock1
    var stock2: Stock2
    var stock3: Stock3
    var nd1: NationalDebt1
    var rt1: Realty1
    
    public init() {
        stock1 = Stock1()
        stock2 = Stock2()
        stock3 = Stock3()
        nd1 = NationalDebt1()
        rt1 = Realty1()
    }
    
    public func sell() {
        stock1.sell()
        stock2.sell()
        stock3.sell()
        nd1.sell()
        rt1.sell()
    }
    
    public func buy() {
        stock1.buy()
        stock2.buy()
        stock3.buy()
        nd1.buy()
        rt1.buy()
    }
    
}



/// 外观模式
func facadePattern() {
    print("------未使用外观模式------")
    let stock1 = Stock1()
    let stock2 = Stock2()
    let stock3 = Stock3()
    stock1.buy()
    stock2.buy()
    stock3.buy()
    stock1.sell()
    stock2.sell()
    stock3.sell()
    
    print("------使用外观模式------")
    let fund = Fund()
    fund.buy()
    fund.sell()
    
}
