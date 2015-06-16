import Foundation

protocol AA {
    func a()
}

class A {
    
}

class B:AA {}

extension AA {
    func a() {print("AA")}
}

extension A : AA {
    func a() {print("A")}
}

var a:AA = A()
a.a()

var b:AA = B()
b.a()

//: [Previous](@previous) | [Next](@next)
