//: [Previous](@previous)

import Foundation
//import Cocoa
import Darwin

// http://ericasadun.com/2015/08/24/up-the-mix-with-beta-6-swiftlang/

//: Enum Completion

enum Test {
    case One, Two, Three
}

func myFunction(e:Test) -> Int {return 1}

myFunction(.One)

//: Static Computed Properties in protocol extension

protocol TimeKnowing {}
extension TimeKnowing {
    static var theTime:NSDate {return NSDate()}
}
extension String:TimeKnowing {}
String.theTime

//: Non-Terminal Variadics

func doThings(nums:Int...,_ thing:([Int]) -> Void) {thing(nums)}
doThings(1,3,5,6,0,2,99,4) {
    array in print("The biggest item is \(array.maxElement()!)")
}

//: ...

// http://ericasadun.com/2015/08/24/yoda-alert-try-swiftlang-hint-beta-6/

//: Try?

enum Error:ErrorType {case Unlucky}
func myFailableFunction(success:Int = 10) throws -> String {
    if success == 10 {throw Error.Unlucky}
    return "Yes"
}

let rrrr1 = try? myFailableFunction(1)// ?? "ac"
print(rrrr1)
let r2 = (try? myFailableFunction(10)) ?? "bc"
print(r2)


do{
    let a = try myFailableFunction()
}catch{
    
}


//: [Previous](@previous) | [Next](@next)

