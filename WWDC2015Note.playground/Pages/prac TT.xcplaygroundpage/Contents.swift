//: [Previous](@previous)

import Foundation

//class 香腸:CustomStringConvertible {
//    let number:Int
//    var properties:String = ""
//    
//    init(number:Int) {
//        self.number = number
//    }
//    
//    var description: String {
//        return "\(properties)香腸\(number)"
//    }
//    
////    mutating func enchent(word:String) {
////        self.properties = word + self.properties
////    }
//    
//}
//
//func 加辣(target:香腸) -> 香腸 {
//    target.properties = "辣" + target.properties
//    print(target)
//    return target
//}
//
//func 加醬(target:香腸) -> 香腸 {
//    target.properties = "醬" + target.properties
//    print(target)
//    return target
//}



//var a = [1,2,3].flatMap{ 香腸.init}
//    >>- 香腸.init

//
//func yumeMap(i:Int) -> Int {
//    print(i)
//    return i
//}
//
//func yumeMap2(i:Int) -> String {
//    let r = "s\(i)"
//    print(r)
//    return r
//}
//
//
//let a = [1,2,3]
////let b = a.map (yumeMap)
//a.map(yumeMap).map(yumeMap2).first
//
//print("-------分隔線---------")
//let lazyB = LazyCollection(a)
//lazyB.map(yumeMap).map(yumeMap2).first
//
//print("-------分隔線---------")
//
//for i in lazyB.map(yumeMap).map(yumeMap2) {
//    print(i)
//}


//struct Yume {}
//let y1 = Yume.Type.self
//struct Yume2 {}
//protocol ABC {}
//protocol ABC2 {}
//ABC.Protocol.self
//extension Yume2:ABC, ABC2{}
//ABC.self

//let y2 = Yume.self
//let y3 = Yume.self.dynamicType
//y2.init() is Yume
//
//Yume() is Yume
//
//y1 == y2
//y1 is Yume
//y2 is Yume
//
//let aaaaa:[Int]? = [1,2,3,4]
//let bbbbb = aaaaa.flatMap{$0}
//bbbbb


struct Yume {
    let a:Int
    init?(i:Int) {
        if i <= 2 {
            print("input: \(i)")
            return nil
        }
        print("init succ \(i)")
        a = i
    }
}

let lazyman = [1,2,3,4,5].lazy.flatMap {Yume(i: $0)}.first
let lazyman2 = [1,2,3,4,5].lazy.first.flatMap {Yume(i: $0)}
lazyman?.a
lazyman2?.a
