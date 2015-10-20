import Foundation

infix operator  >>=  {
    associativity left
    precedence 132
}

func >>= <T,U>(box : Optional<T>, f : T -> Optional<U>) -> Optional<U> {
    return box.flatMap {f($0)}
}

let int4:Int? = 4

func plus(a:Int)(b:Int) -> Int? {
    return a + b
}

let plus3 = plus(3)

func stringfy(a:Int) -> String? {
    return String(a)
}

func plusString(a:String)(b:String) -> String? {
    return a + b
}

let reallyLike = plusString("I really like the number ")


int4 >>= plus(3) >>= stringfy >>= reallyLike
int4 >>= plus3 >>= stringfy >>= reallyLike
nil >>= plus(3) >>= stringfy >>= reallyLike
nil >>= plus3 >>= stringfy >>= reallyLike








let box:Int? = 4
let sum3 = {Optional($0 + 3)}
let toString = {Optional(String($0 + 0))}
let iReallyLike = {Optional("I really like the number " + $0)}
let luckyNumber777 = nil >>= sum3 >>= toString >>= iReallyLike ?? "777"

//public enum Optional<Wrapped> : _Reflectable, NilLiteralConvertible {
//    case None
//    case Some(Wrapped)
//    /// Construct a `nil` instance.
//    public init()
//    /// Construct a non-`nil` instance that stores `some`.
//    public init(_ some: Wrapped)
//    /// If `self == nil`, returns `nil`.  Otherwise, returns `f(self!)`.
//    @warn_unused_result
//    @rethrows public func map<U>(@noescape f: (Wrapped) throws -> U) rethrows -> U?
//    /// Returns `nil` if `self` is nil, `f(self!)` otherwise.
//    @warn_unused_result
//    @rethrows public func flatMap<U>(@noescape f: (Wrapped) throws -> U?) rethrows -> U?
//    /// Create an instance initialized with `nil`.
//    public init(nilLiteral: ())
//}