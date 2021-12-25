import Foundation

/* 装饰器模式总结:
 装饰模式是为已有的功能动态地添加更多功能的一种方式,
 优点: 把类中装饰功能从类中搬移去除,这样可以简化原有的类.
 当系统需要新功能的时候,是向旧的类中添加新的代码,这些新的代码通常装饰了原有类的类型职责或主要行为,而装饰模式提供了一个非常好的解决方案,它把每个要装饰的功能放在单独的类中,并让这个类包装它所要装饰的对象, 因此,当需要执行特殊行为时,客户代码就可以在运行时根据需要有选择地, 按顺序地使用装饰功能包装对象了.
 */

public class Person: NSObject {
    
    var name: String = ""
    
    public convenience init(WithName name: String) {
        self.init()
        self.name = name
    }
    
    public func show() {
        print("\(name)的装扮完成")
    }
    
}


public class Finery: Person {
    
    var component: Person?

    
    public func decorate(component: Person) {
        self.component = component
    }
    
    public override func show() {
        if component != nil {
            component?.show()
        }
    }
    
}


public class TShirts: Finery {
    public override func show() {
        // 装饰功能逻辑
        print("大T❄️")
        super.show()
    }
}


public class BigTrouser: Finery {
    public override func show() {
        // 装饰功能逻辑
        print("裤子")
        super.show()
    }
}


public class Sneakers: Finery {
    public override func show() {
        // 装饰功能逻辑
        print("破球鞋")
        super.show()
    }
}



/// 装饰模式
func decoratorPatter() {
    let p = Person.init(WithName: "Carl")
    let pqx = Sneakers()
    let kk = BigTrouser()
    let dtx = TShirts()
    
    pqx.decorate(component: p)
    kk.decorate(component: pqx)
    dtx.decorate(component: kk)
    
    dtx.show()
}
