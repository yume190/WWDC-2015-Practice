import Foundation

// https://github.com/mxcl/hack.playground/blob/master/Sources/SupportCode.swift

public func dump_ivars(o: AnyObject) {
//    let dict = [:]
    var count: UInt32 = 0
    let ivars = class_copyIvarList(o.dynamicType, &count)
    
    for x in 0..<count {
        let ivar = ivars[Int(x)]
        let name = NSString(CString: ivar_getName(ivar), encoding: NSUTF8StringEncoding) ?? "Error"
        let type = String(UTF8String: ivar_getTypeEncoding(ivar)) ?? "Unknown"
        
        print("\(name): \(type)")
    }
}