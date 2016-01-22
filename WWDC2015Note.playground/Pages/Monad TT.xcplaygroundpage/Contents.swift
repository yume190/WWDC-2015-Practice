import Foundation

infix operator  >>=  {
    associativity left
    precedence 132
}

func >>= <T,U>(box : Optional<T>, f : T -> Optional<U>) -> Optional<U> {
    return box.flatMap {f($0)}
}

//func >>= <T,U>(box : Optional<T>, f : (T -> Optional<U>)?) -> Optional<U> {
//    return box.flatMap { rb in
//        f.flatMap{
//            $0(rb)
//        }
//    }
//}

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


print(int4 >>= plus(3) >>= stringfy >>= reallyLike)
int4 >>= plus3 >>= stringfy >>= reallyLike
nil >>= plus(3) >>= stringfy >>= reallyLike
nil >>= plus3 >>= stringfy >>= reallyLike

if let
    real4 = int4,
    realPlus3 = plus3(b: real4),
    realString = stringfy(realPlus3)
{
    print(reallyLike(b: realString))
}

let box:Int? = 4
let sum3 = {Optional($0 + 3)}
let toString = {Optional(String($0 + 0))}
let iReallyLike = {Optional("I really like the number " + $0)}
let luckyNumber777 = nil >>= sum3 >>= toString >>= iReallyLike ?? "777"
