import UIKit

//// Haskell Bind
//infix operator  >>-  {
//associativity left
//precedence 133
//}
//
////-- (>>=) :: forall a b. m a -> (a -> m b) -> m b
//func >>- <T,U>(box : T?, f : T -> U?) -> U? {
//    return box.flatMap {f($0)}
//}
//
//public func <^> <T, U>(f: T -> U, a: [T]) -> [U] {
//    return a.map(f)
//}

infix operator • {
    associativity left
    precedence 150
}

public func • <A,B,C> (f:(B -> C), g:(A -> B)) -> (A -> C) {
    func gof(a:A) -> C{
        return f(g(a))
    }
    return gof
}

public func • <A,B,C> (f:(B -> C)?, g:(A -> B)?) -> (A -> C)? {
    guard let
        ff = f,
        gg = g else {
        return nil
    }

    return ff • gg
}

public func IDENTITY<A>(a:A) -> A {
    return a
}

public func IDENTITY<A>(a:A?) -> A? {
    return a
}

public func measure<T,U>(call: T -> U) -> T -> U {
    func f(t:T) -> U {
        let startTime = CACurrentMediaTime()
        let result = call(t)
        let endTime = CACurrentMediaTime()
        print("Time - \(endTime - startTime)")
        return result
    }
    
    return f
}

func fake<T,U>(s:String,call: T -> U) -> T -> U {
    print("fake")
    return call
}