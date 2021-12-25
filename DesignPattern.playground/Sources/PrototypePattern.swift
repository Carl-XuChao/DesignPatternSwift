import Foundation


public class Resume: NSObject, NSCopying, NSMutableCopying {
   
    
    public var name: String = ""
    
    public var age = 0
    
    
    public func copy(with zone: NSZone? = nil) -> Any {
        let p = Resume.init()
        p.name = self.name
        p.age = self.age
        return p
    }
    
    public func mutableCopy(with zone: NSZone? = nil) -> Any {
        let p = Resume.init()
        p.name = self.name
        p.age = self.age
        return p
    }
    
}



/// 原型模式
func prototypePattern() {
    let resume = Resume()
    resume.age = 10
    resume.name = "carl"
    
    let copyResume = resume.copy()
    
    
    print("拷贝前对象: \(resume.name): \(resume.age)")
    if let copyResume = copyResume as? Resume {
        copyResume.age = 20
        copyResume.name = "zak"
        print("拷贝后对象: \(copyResume.name): \(copyResume.age)")
    }
    
}
