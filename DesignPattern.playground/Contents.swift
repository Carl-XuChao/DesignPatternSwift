//: [Previous](@previous)

import Foundation


/// 简单工厂方法
func simplyFactoryMethod() {
    let oper = OperationFactory.createOperation(operate: "+")
    oper?.a = 10
    oper?.b = 20
    _ = oper?.getResult()
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


/// 代理模式
func proxyPattern() {
    let jiaojiao = SchoolGirl()
    jiaojiao.name = "李娇娇"
    let proxy = Proxy(WithSchoolGirl: jiaojiao)
    proxy.giveDolls()
    proxy.giveFlowers()
    proxy.giveChocolate()
}


/// 工厂模式
func factoryPattern() {
    let factory = StudentFactory()
    let stu = factory.createLeiFeng()
    stu.sweep()
    stu.wash()
    stu.buyRice()
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


/// 模板方法模式
func templatePattern() {
    print("------学生A开始答题------")
    let stuA = TestPaperA()
    stuA.testQuestion1()
    stuA.testQuestion2()
    stuA.testQuestion3()
    
    print("------学生B开始答题------")
    let stuB = TestPaperB()
    stuB.testQuestion1()
    stuB.testQuestion2()
    stuB.testQuestion3()
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


/// 构造者模式
func builderPattern() {
    let builder = PersonThinBuilder()
    let dirctor = PersonDirctor(WithPersonBuilder: builder)
    dirctor.createPerson()
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

func abstractFactory() {
    let user = User()
    let dept = Department()
    let iu = DataAccess.createUser()
    iu.insert(u: user)
    iu.getUser(id: 1)
    
    let idept = DataAccess.createDepartment()
    idept.insert(d: dept)
    idept.getDepartment(id: 1)
    
    
}



simplyFactoryMethod()
print("======================================================")
strategyPattern(type: 0, money: 500)
strategyPattern(type: 1, money: 500)
strategyPattern(type: 2, money: 500)
print("======================================================")
decoratorPatter()
print("======================================================")
proxyPattern()
print("======================================================")
factoryPattern()
print("======================================================")
prototypePattern()
print("======================================================")
templatePattern()
print("======================================================")
facadePattern()
print("======================================================")
builderPattern()
print("======================================================")
observerPattern()
print("======================================================")
abstractFactory()
print("======================================================")
