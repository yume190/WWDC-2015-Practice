import Foundation
import UIKit

func execute<T,U>(function:(T->U)) -> (parameter:T) -> U {
    return { (parameter:T) -> U in
        return function(parameter)
    }
}

func cantExeCute<T>(function:T) {
//    function()
}

//: ## `func VoidToVoid(){}`
//:
//: 形態可以表示成 `() -> ()` or `Void -> Void`
//:
//: 以 Generic 觀點來看
//:
//: 如果是以`Ｔ`來接收 `(() -> ())` or `(Void -> Void)`。就算丟進來的 T 是函數，但並不能執行
//:
//: 那如果是以 `T -> U` 來接 `Void -> Void`，表示這個變數是個接收T參數的函數並回傳U
func VoidToVoid(){}
let void1:()->() = VoidToVoid
let void2:Void->Void = VoidToVoid

//----------------------------------------------------------------------------------------------

// 形態可以表示成 : `(Int,Int) -> Int`，也就是 tuple -> Int
// 這邊比較可惜的是 不能直接呼叫 `add(aAndB)`
func add(a:Int,b:Int) -> Int {
    return a + b
}

let aAndB = (1,2)
let aAndB2 = (1,b:2)
// add(aAndB)
add(aAndB2)
execute(add)(parameter: aAndB)
let newFunc = execute(add)
newFunc


//import Foundation
//import UIKit
//
//func execute<T,U>(function function:((T)->U)) -> (_ parameter:T) -> U {
//    return { (parameter:T) -> U in
//        return function(parameter)
//    }
//}
//
//func cantExeCute<T>(function:T) {
//    //    function()
//}
//
////: ## `func VoidToVoid(){}`
////:
////: 形態可以表示成 `() -> ()` or `Void -> Void`
////:
////: 以 Generic 觀點來看
////:
////: 如果是以`Ｔ`來接收 `(() -> ())` or `(Void -> Void)`。就算丟進來的 T 是函數，但並不能執行
////:
////: 那如果是以 `T -> U` 來接 `Void -> Void`，表示這個變數是個接收T參數的函數並回傳U
//func VoidToVoid(){}
//let void1:()->() = VoidToVoid
//let void2:(Void)->Void = VoidToVoid
//
////----------------------------------------------------------------------------------------------
//
//// 形態可以表示成 : `(Int,Int) -> Int`，也就是 tuple -> Int
//// 這邊比較可惜的是 不能直接呼叫 `add(aAndB)`
//func add(a:Int,b:Int) -> Int {
//    return a + b
//}
//
//let aAndB1 = (1,2)
//let aAndB2 = (1,b:2)
//let aAndB3 = (a:1,2)
//let aAndB4 = (a:1,b:2)
////add(aAndB1)
////add(aAndB2)
////add(aAndB3)
////add(aAndB4)
//let newFunc = execute(function: add)
//newFunc(aAndB1)
//newFunc(aAndB2)
//newFunc(aAndB3)
//newFunc(aAndB4)
////execute(function:add)(parameter: aAndB)
////let newFunc = execute(function:add)
////newFunc