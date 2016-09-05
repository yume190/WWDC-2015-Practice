import Foundation

public class Person1 {
    public var name: String {
        return _name
    }
    private var _name: String = "p1"
    
    public init(){}
}

public class Person2 {
    public private(set) var name: String
    // ...
    
    public init(name:String) {
        self.name = name
    }
}