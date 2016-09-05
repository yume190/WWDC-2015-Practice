//: [Previous](@previous)

import UIKit

@warn_unused_result
public func Init<Type>(value : Type, @noescape block: (object: Type) -> Void) -> Type
{
    block(object: value)
    return value
}

func example() {
    let label = Init(UILabel()) {
        $0.font = UIFont.boldSystemFontOfSize(13.0)
        
        $0.text = "Hello, World"
        $0.textAlignment = .Center
    }
    print(label.text)
}

example()