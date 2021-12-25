import Foundation

/*
 模板方法模式, 定义一个操作中的算法骨架, 而将一些buzou延迟到子类中.
 模板方法使得子类可以不改变一个算法的结构即可重定义该算法的某些特定buzou.
 模板方法模式是通过把不变的行为搬移到超类, 去除子类中的重复代码来体现它的优势.
 */

public class TestPaper: NSObject {
    
    // --- 公共模板方法
    public func testQuestion1() {
        print("测试题目1: ...")
        answer1()
    }
    
    public func testQuestion2() {
        print("测试题目2: ...")
        answer2()
    }
    
    public func testQuestion3() {
        print("测试题目3: ...")
        answer3()
    }
    
    
    // ---- 以下为子类需要实现的方法
    public func answer1() {
        print("答案1: ---")
    }
    
    public func answer2() {
        print("答案2: ---")
    }
    
    public func answer3() {
        print("答案3: ---")
    }
}


public class TestPaperA: TestPaper {
    
    override public func answer1() {
        print("A 选手的 第 1 题的答案是....")
    }
    
    override public func answer2() {
        print("A 选手的 第 2 题的答案是....")
    }
    
    override public func answer3() {
        print("A 选手的 第 3 题的答案是....")
    }
}


public class TestPaperB: TestPaper {
    
    override public func answer1() {
        print("B 选手的 第 1 题的答案是xxx")
    }
    
    override public func answer2() {
        print("B 选手的 第 2 题的答案是xxx")
    }
    
    override public func answer3() {
        print("B 选手的 第 3 题的答案是xxx")
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
