//: [Previous](@previous)

import Foundation

protocol MyProtocol {
    func text() -> String
}

class Temp:MyProtocol {
    func text() -> String {
        return "Temp"
    }
}

extension MyProtocol {
    final func text() -> String {
        return "MyProtocol"
    }
}

let delegate:MyProtocol = Temp()
delegate.text()