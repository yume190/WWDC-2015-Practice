import Foundation
import UIKit

@objc
class A {
    var aa:String = "aa"
}

protocol YumeCopy {
    func copy(a:Self) -> Bool
//    func copy2() -> Se lf
}

protocol I {
    init()
}

//extension YumeCopy where Self:I{
//    func copy() -> Self {
//        return Self()
//    }
//}

extension A:YumeCopy{
//    func copy() -> A {
//        return A()
//    }
    func copy(a: A) -> Bool {
        return false
    }
    
//    func copy2() -> A {
//        return A()
//    }
}
    
//, NSCopying {
//    
//    func copyWithZone(zone: NSZone) -> AnyObject! {
//        return B()
//    }

struct SA {
    var p:CGPoint
    private var a:A
    
    var a2:A{
        return a
    }
    
    var a1:A {
        mutating get {
            a = A()
            return a
        }
    }
}

var a1 = SA(p: CGPoint(x: 0, y: 0), a: A())
var a2 = a1

a1.a.aa = "bb"
a1.a.aa
a2.a.aa
//
//a1.a === a2.a

//: [Previous](@previous) | [Next](@next)
