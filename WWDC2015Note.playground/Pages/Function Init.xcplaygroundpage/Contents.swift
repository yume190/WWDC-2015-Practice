//: [Previous](@previous)

import Foundation
import UIKit

struct A1 {
    let a:String?
    let b:Int
}

extension A1 {
    init(a:String,b:Int,C:Int) {
        self.a = a
        self.b = a.characters.count
    }
}

struct A2 {
    let a:String = ""
    let b:Int
}

//class B1 {
//    let a:String
//    let b:Int
//}

class B2 {
    let a:String = ""
    let b:Int = 0
}

//let ia1 = A1.init
let ia1plus = A1.init(a:b:)
A1.init(a:b: C: )
let ia2 = A2.init
let ib2 = B2.init

let iView = UIView.init(frame:)
let view = CGRectZero >>- iView




//
//
//
//
//let dic = NSMutableDictionary()
//dic.setValue("a", forKey: "a")
//dic.setValue(1, forKey: "b")
//
//
//dic.valueForKey("a")
//
//
//let aaaa = (
//        "a",
//        1
//    )
//    >>- ia1
//aaaa?.a
//aaaa?.b
