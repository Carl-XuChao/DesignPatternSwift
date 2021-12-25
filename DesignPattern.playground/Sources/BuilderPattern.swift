import Foundation

public protocol PersonBuilder {
    func buildhead()
    func buildBody()
    func buildArmLeft()
    func buildLegLeft()
}


/// 瘦子构造器
public class PersonThinBuilder: PersonBuilder {
    
    public init() {
        
    }
    
    public func buildhead() {
        print("瘦子:  构造头部")
    }
    
    public func buildBody() {
        print("瘦子:  构造身体")
    }
    
    public func buildArmLeft() {
        print("瘦子:  构造左手")
    }
    
    public func buildLegLeft() {
        print("瘦子:  构造左腿")
    }
    
    
    
}


/// 胖子构造器
public class PersonFatBuilder: PersonBuilder {
    
    public func buildhead() {
        print("胖子:  构造头部")
    }
    
    public func buildBody() {
        print("胖子:  构造身体")
    }
    
    public func buildArmLeft() {
        print("胖子:  构造左手")
    }
    
    public func buildLegLeft() {
        print("胖子:  构造左腿")
    }
    
    
    public init() {
        
    }
}



/// 指挥者, 来控制建造过程
public class PersonDirctor {
    
    var personBuilder: PersonBuilder
    
    public init(WithPersonBuilder builder: PersonBuilder) {
        self.personBuilder = builder
    }
    
    public func createPerson() {
        personBuilder.buildhead()
        personBuilder.buildBody()
        personBuilder.buildArmLeft()
        personBuilder.buildLegLeft()
    }
    
}




/// 构造者模式
func builderPattern() {
    let builder = PersonThinBuilder()
    let dirctor = PersonDirctor(WithPersonBuilder: builder)
    dirctor.createPerson()
}
