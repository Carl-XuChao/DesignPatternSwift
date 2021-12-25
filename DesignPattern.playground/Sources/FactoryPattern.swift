import Foundation

/* 工厂方法模式实现时, 客户端需要决定实例化那一个工厂来实现运算类, 选择判断的问题还是存在的, 也就是说, 工厂方法把简单工厂的内部逻辑判断移到了客户端代码来进行, 你想要加功能, 本来是改工厂类的, 而现在是修改客户端.
 */



/// 雷锋类
public class LeiFeng: NSObject {
    
    public override init() {
        super.init()
    }
    
    public func sweep() {
        print("扫地")
    }
    
    public func wash() {
        print("洗衣服")
    }
    
    public func buyRice() {
        print("买买米")
    }
    
}


/// 大学生
public class Student: LeiFeng {
    
}


/// 志愿者
public class Volunteer: LeiFeng {
    
}


/// 简单工厂类
public class SimpleFactory: NSObject {
    
    public override init() {
        super.init()
    }
    
    public func createLeifeng(type: String) -> LeiFeng {
        switch type {
        case "大学生":
            return Student()
        case "志愿者":
            return Volunteer()
        default:
            return LeiFeng()
        }
    }
    
}



/// 抽象接口
public protocol IFactory {
    func createLeiFeng() -> LeiFeng
}


/// 大学生工厂
public class StudentFactory: NSObject,IFactory {
    
    public override init() {
        super.init()
    }
    
    public func createLeiFeng() -> LeiFeng {
        return Student()
    }
    
}


/// 志愿者工厂
public class VolunteerFactory: NSObject,IFactory {
    
    public override init() {
        super.init()
    }
    
    public func createLeiFeng() -> LeiFeng {
        return Volunteer()
    }
    
}


/// 工厂模式
func factoryPattern() {
    let factory = StudentFactory()
    let stu = factory.createLeiFeng()
    stu.sweep()
    stu.wash()
    stu.buyRice()
}
