import Foundation

/* 代理模式: 为其他对象提供一种代理以控制对这个对象的访问.
 代理使用的场合:
 1. 远程代理, 也就是为一个对象在不同的地址空间提供局部代表, 这样可以隐藏一个对象存在于不同地址空间的事实.
 2. 虚拟代理, 是根据需要创建开销很大的对象, 通过它来存放实例化需要很长时间的真是对象.
 3. 安全代理, 用来控制真实对象的访问时的权限
 4. 智能指引, 是指当调用真实的对象时, 代理处理另外一些事.
 */

public protocol IGiveGift {
    func giveDolls()
    func giveFlowers()
    func giveChocolate()
}


/// 女孩
public class SchoolGirl: NSObject {
    
    public var name = ""
    public override init() {
        super.init()
    }
}


/// 追求者
public class Pursuit: NSObject,IGiveGift {
    
    var mm: SchoolGirl
    
    public init(WithSchoolGirl girl: SchoolGirl) {
        self.mm = girl
    }
    
    public func giveDolls() {
        print("\(mm.name)送你洋娃娃")
    }
    
    public func giveFlowers() {
        print("\(mm.name)送你花")
    }
    
    public func giveChocolate() {
        print("\(mm.name)送你巧克力")
    }
    
    
}


/// 代理
public class Proxy: NSObject,IGiveGift {
    
    var gg: Pursuit
    
    public init(WithSchoolGirl girl: SchoolGirl) {
        self.gg = Pursuit(WithSchoolGirl: girl)
    }
    
    
    public func giveDolls() {
        gg.giveDolls()
    }
    
    public func giveFlowers() {
        gg.giveFlowers()
    }
    
    public func giveChocolate() {
        gg.giveChocolate()
    }
    
    
}


/// 代理模式
func proxyPattern() {
    let jiaojiao = SchoolGirl()
    jiaojiao.name = "李娇娇"
    let proxy = Proxy(WithSchoolGirl: jiaojiao)
    proxy.giveDolls()
    proxy.giveFlowers()
    proxy.giveChocolate()
}
