import UIKit

// http://milen.me/writings/swift-generic-protocols/
// http://austinzheng.com/2015/09/29/swift-generics-pt-2/

extension Array where Element:UIView {
    func centerX() -> [NSLayoutConstraint] {
        return []
    }
}

let aaaa:[UIView] = []
aaaa.centerX()

class ABC{}
protocol AAA {
    func aaa() -> String
}
protocol BBB {
    func bbb() -> String
}

extension ABC:AAA {
    func aaa() -> String {
        return "aaa"
    }
}
extension ABC:BBB {
    func bbb() -> String {
        return "bbb"
    }
}

let ccc:protocol<AAA,BBB> = ABC()
ccc.aaa()
ccc.bbb()

typealias AAABBB = protocol<AAA,BBB>
extension Array where Element:AAABBB {
    func aabb() {
        print("aabb")
    }
}
extension Array where Element:protocol<AAA,BBB> {
    func bbaa() {
        print("bbaa")
    }
}

let ab1:[ABC] = []
let ab2:[AAABBB] = []
var ab3:[protocol<AAA,BBB>] = []

ab1.aabb()
ab1.bbaa()
ab3.count
ab3.append(ABC())
ab3.flatMap{
    $0.bbb()
}
//ab2.aabb()
//ab2.bbaa()





















//let pass1 = ()
//pass1.dynamicType
//let pass2 = Void()















