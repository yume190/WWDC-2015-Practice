import Foundation

public final class Box<T> {
    let value : T
    
    public init(_ value : T) {
        self.value = value
    }
}

func map <T,U>(box : Box<T>, f : T -> U) -> Box<U> {
    return Box(f(box.value))
}

func flatten <T>(box : Box<Box <T>>) -> Box <T> {
    return box.value
}

infix operator  >>=  {associativity left}
func >>= <T,U>(box : Box<T>, f : T -> Box<U>) -> Box<U> {
    return flatten(map(box,f: f))
}

let box = Box(4)
//let abc = {Box2($0 + 0, $1 + 0)}
let sum3 = {Box($0 + 3)}
sum3
let toString = {Box(String($0 + 0))}
let iReallyLike = {Box("I really like the number " + $0)}

toString(1).value
iReallyLike("777").value

let luckyNumber7 = box >>= sum3 >>= toString >>= iReallyLike

luckyNumber7.value


let f = {Box($0 + 1)}
let a = 1

let x = Box(a) >>= f
let y = f(a)

let ddd = [1]
var ddd2 = ddd.flatMap{$0 * 10}
ddd2


//func constructor<T>(value: T) -> Box<T> {
//    return Box(value)
//}
//
//let x = Box(1)
//let y = Box(1) >>= constructor

//let double = {Box(2 * $0)}
//let triple = {Box(3 * $0)}
//
//let x = Box(1) >>= double >>= triple
//let y = Box(1) >>= {double($0) >>= triple}














var aaa = [1,2,3]
var bbb = aaa.map{$0 * 10}
bbb
var ccc = aaa.flatMap{$0 * 10}
ccc

let nestedArray = [[1,2,3], [4,5,6]]

let flattenedArray = nestedArray.flatMap { $0.map {$0 * 2} }
flattenedArray

let optionalInts:[[Int?]] = [[1], [2,nil],[3, nil], [4, nil, 5]]

let intsss = optionalInts.flatMap { $0 }.flatMap { $0 }
intsss





//["1",nil,"2"].map{return $0}
let ma = ["1",nil,"2"].flatMap{return $0}
ma











let arr = [1,2,3,4,5,6]
let mapArr = arr.map{$0 > 2 ? $0 as Int? : nil}
mapArr











//var box2 = [Box(4),Box(5)]
//let box22 = box2 >>= { (a: [Box<Int>]) -> ([Box<Int>]) in
//    return a.map {Box($0+1)}
//}
//box22
//let sum3 = {Box($0 + 3)}
//let toString = {Box(String($0 + 0))}
//let iReallyLike = {Box("I really like the number " + $0)}
//
//toString(1).value
//iReallyLike("777").value
//
//let luckyNumber7 = box >>= sum3 >>= toString >>= iReallyLike


//var adc:Int? = 10
//if let addd = adc {
//    print(addd)
//} else {
//    print(addd)
//}
