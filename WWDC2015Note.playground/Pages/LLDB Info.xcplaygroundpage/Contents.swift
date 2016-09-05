//: [Previous](@previous)

import Foundation
import XCPlayground

/*:
402 P153
 
## Four Swift protocols
 * CustomStringConvertible
 * CustomDebugStringConvertible
 * CustomPlaygroundQuickLookable
 * CustomReflectable
*/

struct Person {
    let firstName:String
    let lastName:String
}

extension Person: CustomStringConvertible {
    var description: String {
        return "Normal \(firstName) \(lastName)"
    }
}

extension Person: CustomDebugStringConvertible {
    var debugDescription: String {
        return "Debug \(firstName) \(lastName)"
    }
}

extension Person: CustomPlaygroundQuickLookable {
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        return PlaygroundQuickLook.Text("Playground \(firstName) \(lastName)")
    }
}

extension Person: CustomReflectable {
    func customMirror() -> Mirror {
        return Mirror(self, children: [
            "Type" : "Mirror",
            "Content" : "\(self)"
            ])
    }
}

let Yume = Person(firstName: "Yume", lastName: "Lin")
print(Yume)
debugPrint(Yume)
Yume // LLDB > po Yume






