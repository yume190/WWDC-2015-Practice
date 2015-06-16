import Foundation

protocol AA {
    func a()
}

class A {
    
}

extension AA {
    func a() {print("AA")}
}

extension A : AA {
    func a() {print("A")}
}

var a:AA = A()
a.a()

//: [Previous](@previous) | [Next](@next)
