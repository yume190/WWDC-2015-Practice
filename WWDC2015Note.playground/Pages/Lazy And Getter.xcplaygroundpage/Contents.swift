import Foundation

class LazyAndGetter {
    static var target = [1,2,3]
    static var lazy = {
        return target.count
    }()
    
    static var getter:Int {
        return target.count
    }
    
}

LazyAndGetter.target

LazyAndGetter.lazy
LazyAndGetter.getter

LazyAndGetter.target.append(4)
LazyAndGetter.lazy
LazyAndGetter.getter