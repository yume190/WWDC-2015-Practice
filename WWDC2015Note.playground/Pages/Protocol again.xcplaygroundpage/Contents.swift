import Foundation

protocol A {
        //func a() -> String
}

extension A {
    func a() -> String {
        return "protocol"
    }
}

class AA : A {
    func a() -> String {
        return "AA"
    }
}

var a = AA()
a.a()

var b:A = a
b.a()