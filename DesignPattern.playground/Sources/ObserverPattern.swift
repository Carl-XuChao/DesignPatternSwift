import Foundation

/*
 观察者模式: 定义了一种一对多的依赖关系, 让多个观察者对象同时监听某一个对象主题, 这个主题对象在状态发生变化时, 会通知所有的观察者对象, 使他们能够自己更新自己.
 使用时机:
 当一个对象的改变需要同时改变其他对象, 而且它不知道具体有多少对象有改变时.
 */

public protocol Subject {
    func attach(observer: Observer)
    func detach(observer: Observer)
    func notify()
    var subjectState: String {get set}
}


public protocol Observer {
    
    var name: String {get set}
    
    var sub: Subject {get set}
    
    func update()
    
}



/// 老板 --- 被观察者
public class Boss: Subject {
    
    var observerLists = [Observer]()
    var action = ""
    
    public init() {
            
    }
    
    public func attach(observer: Observer) {
        observerLists.append(observer)
    }
    
    public func detach(observer: Observer) {
        observerLists = observerLists.filter { item in
            return item.name != observer.name
        }
        
    }
    
    public func notify() {
        for observer in observerLists {
            observer.update()
        }
    }
    
    public var subjectState: String {
        get {
            return action
        }
        set {
            action = newValue
        }
    }
    
    
}



/// 炒股同事 -- 观察者
public class StockObserver: Observer {
    
    public var name: String
    
    public var sub: Subject
    
    public func update() {
        print("\(sub.subjectState)  \(name) 关闭股票行情继续工作!")
    }
    
    
    public init(WithName name: String, sub: Subject) {
        self.name = name
        self.sub = sub
    }
    
    
}



func observerPattern() {
    let boss = Boss()
    let zak = StockObserver(WithName: "zak", sub: boss)
    let carl = StockObserver(WithName: "carl", sub: boss)
    
    boss.attach(observer: zak)
    boss.attach(observer: carl)
    
    boss.subjectState = "老板回来了"
    boss.notify()
    
    print("观察状态变化")
    boss.detach(observer: zak)
    boss.subjectState = "老板走了"
    boss.notify()
    
}
