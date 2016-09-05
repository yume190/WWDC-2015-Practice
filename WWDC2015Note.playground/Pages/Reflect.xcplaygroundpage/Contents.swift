import UIKit

// http://blog.gregttn.com/2015/08/reflection-api-in-swift-2/
class Person {
    let name: String
    let surname: String
    let address: Address
    
    init(name: String, surname: String, address: Address) {
        self.name = name
        self.surname = surname
        self.address = address
    }
}

struct Address {
    let city: String
    let street: String
    let houseNumber: Int
}

func inspect(obj: Any) {
    let type: Mirror = Mirror(reflecting:obj)
    
    print("Type of the object: \(type.subjectType)")
    print("Display style: \(type.displayStyle)")
    print("Description: \(type.description)")
    print("Number of Properties: \(type.children.count)")
    
    for child in type.children {
        print("Property: \(child.label!) Value: \(child.value) Type: \(child.value.dynamicType)")
    }
    print("-----------------------------------")
}

Any.Type.self

let view = CustomViewLight()


let reflectView = Mirror(reflecting: view)

//inspect(CustomViewLight)
inspect(view)
//inspect(reflectView)
//inspect("Yume")

public typealias Child = (label: String?, value: Any)
let person = Person(name: "Foo", surname: "Bar", address: Address(city: "London", street: "Awesome street", houseNumber: 10))

inspect(person)
inspect(person.address)
inspect({ Optional($0 + 1) })
let f = { Optional($0 + 1) }
inspect(view.frameworkBundle)

reflectView.children
reflectView.customMirror()
//reflectView.descendant(MirrorPathType, <#T##rest: MirrorPathType...##MirrorPathType#>)
//let reflect:Ref









// https://netguru.co/blog/reflection-swift
struct Vector {
    
    typealias Position = (x: Double, y: Double)
    
    let start: Position
    let end: Position
    
    var length: Double {
        return sqrt(
            pow(end.x - start.x, 2) +
            pow(end.y - start.y, 2)
        )
    }
}

extension Vector: CustomReflectable {
    func customMirror() -> Mirror {
        return Mirror(self, children: [
            "start": "\(start.x) × \(start.y)",
            "end": "\(end.x) × \(end.y)",
            "length": length
            ])
    }
}

extension Vector: CustomPlaygroundQuickLookable {
    func customPlaygroundQuickLook() -> PlaygroundQuickLook {
        let bezierPath = UIBezierPath()
        // draw the arrow
//        bezierPath.moveToPoint(CGPointMake(CGFloat(start.x), CGFloat(start.y)))
//        bezierPath.addLineToPoint(CGPointMake(CGFloat(end.x), CGFloat(end.y)))
//        bezierPath.lineWidth = 5
//        bezierPath.stroke()
        return .BezierPath(bezierPath)
    }
}

Vector(start: (0, 0), end: (1, 1))















