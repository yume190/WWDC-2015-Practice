//: [Previous](@previous)

import Foundation
//http://www.russbishop.net/swift-2-1
//http://ericasadun.com/2015/09/23/new-to-beta-2-swift-2-1-playground-value-drops-swiftlang/

var x1 = [String]()
var x2:[String] = []

x1
x2

//http://www.uraimo.com/2015/09/29/Swift2.1-Function-Types-Conversion-Covariance-Contravariance/

// See original post at http://www.uraimo.com/2015/09/29/Swift2.1-Functions-Covariance-Contravariance/

func testVariance(foo:(Int)->Any){foo(1)}

func innerAnyInt(p1:Any) -> Int{ return 1 }
func innerAnyAny(p1:Any) -> Any{ return 1 }
func innerIntInt(p1:Int) -> Int{ return 1 }
func innerIntAny(p1:Int) -> Any{ return 1 }

testVariance(innerIntAny)
testVariance(innerAnyInt)
testVariance(innerAnyAny)
testVariance(innerIntInt)
