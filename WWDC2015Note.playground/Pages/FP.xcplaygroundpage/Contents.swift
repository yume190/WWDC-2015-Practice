import Foundation

// https://thedet.wordpress.com/2012/04/28/functors-monads-applicatives-can-be-so-simple/
// Functor (a -> b) => f a -> f b
// Monad (a -> f b) => f a -> f b
// Applicative f (a -> b) => f a -> f b

public class K1<A> { public init() {} }

//-- (<$>) ::  Functor f => (a -> b) -> f a -> f b


//protocol Functor2 {
//    associatedtype T
//    func map<P>(mappingFunction: T -> P) -> Self<P>
//}

protocol YumeFunctor {
    associatedtype T = Self
    associatedtype U = T.Type
}

extension Optional {
//    typealias T = Wrapped
    func mmap<P>(f: Wrapped -> P) -> Void -> P? {
        
        return {
            self.flatMap {f($0)}
        }
    }
    func mmmap() {
        
    }
}
print(Int?.self)
let a:Int? = 1
let b = a.mmap{$0+1}
//b


//extension Optional {
////    typealias T = Wrapped
//    func mmap<P>(f: Wrapped -> P) -> P? {
//        return self.flatMap {f($0)}
//    }
//}
//
//public protocol Functor {
//    associatedtype A
//    associatedtype B
//    associatedtype FB //= K1<B>
//    func fmap(f: A -> B) -> FB
//}
//
//extension Optional:Functor {
//    public typealias A = Wrapped
//    public typealias B = Any
//    public typealias FB = B?
//    
//    public func fmap<B>(f: A -> B) -> B? {
//        return self.flatMap {f($0)}
//    }
////    public func fmap<B>(f: A -> B) -> Optional.FB {
////        return self.flatMap {f($0)}
////    }
//}
//
//extension Array:Functor {
//    public typealias A = Array.Generator.Element
//    public typealias B = Any
//    public typealias FB = [B]
//    
//    public func fmap<B>(f: A -> B) -> [B] {
//        return self.flatMap {f($0)}
//    }
//}
//
////let qwer:[Int] = []
////var asbdf:Functor = qwer
////asbdf.fmap
//
//var bbbb = [1,2,3]
//
//let bbbb2 = bbbb.fmap{String($0 * 3)}
//bbbb2
//
//func asdf(s:Int) -> String {
//    return String(s)
//}
//
//
//var a:Int? = 1
//let aa3 = a.fmap{String($0+0)}
//let aa4 = a.mmap{$0+1}
//aa3
//aa4