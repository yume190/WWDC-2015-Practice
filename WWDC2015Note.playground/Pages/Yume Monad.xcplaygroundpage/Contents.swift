import Foundation

public class K1<A> { public init() {} }

//-- (<$>) ::  Functor f => (a -> b) -> f a -> f b

public protocol Functor {
    typealias A
    typealias B
    typealias FB = K1<B>
    func fmap(f: A -> B) -> FB
}

extension Optional:Functor {
    public typealias A = Wrapped
    public typealias B = Any
    public typealias FB = B?
    
    public func fmap<B>(f: A -> B) -> B? {
        return self.flatMap {f($0)}
    }
}

extension Array:Functor {
    public typealias A = Array.Generator.Element
    public typealias B = Any
    public typealias FB = [B]
    
    public func fmap<B>(f: A -> B) -> [B] {
        return self.flatMap {f($0)}
    }
}

var bbbb = [1,2,3]

let bbbb2 = bbbb.fmap{String($0 * 3)}
bbbb2

func asdf(s:Int) -> String {
    return String(s)
}


var a:Int? = 1
let aa3 = a.fmap{String($0+0)}
aa3

//aa3(fa: 1)

//protocol Context {
//    typealias B
//    typealias FB = K1<B>
//    func to(t:B) -> FB
//}
//
//extension Optional:Context {
//    
//    typealias B = Any
//    typealias FB = B?
//    
//    func to<B>(t: B) -> B? {
//        return t
//    }
//    
//}






//    -- fmap ::            (a -> b) -> f a -> f b
//-- (<$>) ::  Functor f => (a -> b) -> f a -> f b
//-- (<*>) ::             f (a -> b) -> f a -> f b
//-- (>>=) :: forall a b. m a -> (a -> m b) -> m b

// Haskell Bind
infix operator  >>-  {
    associativity left
    precedence 133
}

//-- (>>=) :: forall a b. m a -> (a -> m b) -> m b
func >>- <T,U>(box : T?, f : T -> U?) -> U? {
    return box.flatMap {f($0)}
}

//// Bind (wrap, decorator)
//infix operator  <*>  {
//    associativity left
//    precedence 133
////    precedence 132
//}
//
////-- (<*>) :: f (a -> b) -> f a -> f b
//func <*> <T,U>(f : (T -> U)?,box : T?) -> U? {
//    return box.flatMap { input in
//        f.flatMap { $0(input) }
//    }
//}
//
//func <*> <T,U>(f : [(T -> U)],box : [T]) -> [U] {
//    return box.flatMap { input in
//        f.flatMap { $0(input) }
//    }
//}

let dddd = [asdf,asdf] <*> []


//@decorator
//def func():
//    pass
//func = decorator(func)

//@hello
//def foo():
//    print "i am foo"
//foo = hello(foo)

func abcd() {}
let dcba:Void->Void = abcd

let f = { Optional( $0 + 0) }
func yume(inin:String) -> String {
    print("yume:"+inin)
    return "yume:"+inin
}
func yume2(a:Int,b:Int) -> Int {
    return a+b
}

func hello<T,U>(parameter:T,function:(T->U)) -> U{
    print("1. before")
    let result = function(parameter)
    print(result)
    print("1. after")
    print("---------------------------")
    return result
}

func hello<U>(function:(Void->U)) -> U{
    print("2. before")
    let result = function()
    print(result)
    print("2. after")
    print("---------------------------")
    return result
}

func wrap<T,U>(function:(T->U))(parameter:T) -> U{
    print("wrap. before")
    let result = function(parameter)
    print("wrap. after")
    return result
}

func wrap2<T,U>(function:(T->U)) -> (T -> U){
    func wrapFunction(parameter:T) -> U {
        print("wrap2. before")
        let result = function(parameter)
        print("wrap2. after")
        return result
    }
    
    return wrapFunction
}


let kkkkk = yume >>- wrap

kkkkk <*> "Yo!"
print("")
((yume >>- wrap) >>- wrap2) <*> "Yo!"
yume >>- wrap >>- wrap2 <*> "Yo!"




func wrapAAA(function:String->String)(parameter:String) -> String {
    return "AAA " + function(parameter) + " AAA"
}

func wrapBBB(function:String->String)(parameter:String) -> String {
    return "BBB " + function(parameter) + " BBB"
}

func YumeSay(inin:String) -> String {
    return "yume:"+inin
}


YumeSay <*> "Yo!"
YumeSay >>- wrapAAA <*> "Yo!"
YumeSay >>- wrapBBB <*> "Yo!"
YumeSay >>- wrapAAA >>- wrapBBB <*> "Yo!"
YumeSay >>- wrapBBB >>- wrapAAA <*> "Yo!"

wrapAAA(wrapBBB(YumeSay))(parameter: "Yo!")

//hello(1, function: f)
//hello(2, function: f)
//hello(3, function: f)
//
//hello("Yo!", function: yume)
//hello("Oh No~~~", function: yume)
//
hello((1,2), function: yume2)
//
//hefllo(abcd)



// Optional:
//public func <^><T, U>(f: T -> U, a: T?) -> U?
//public func <*><T, U>(f: (T -> U)?, a: T?) -> U?
//public func >>-<T, U>(a: T?, f: T -> U?) -> U?
//public func -<<<T, U>(f: T -> U?, a: T?) -> U?
//public func pure<T>(a: T) -> T?

//    -- fmap ::           (a -> b) -> f a -> f b
//-- (<$>) :: Functor f => (a -> b) -> f a -> f b
//-- (<*>) ::            f (a -> b) -> f a -> f b
//-- (>>=) :: forall a b. m a -> (a -> m b) -> m b
