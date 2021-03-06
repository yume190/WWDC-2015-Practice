import Foundation

import UIKit

let object:Any = "beep boop"

let isString = object is String //true

let mirror = Mirror(reflecting: object)
let typeOfObject:Any.Type = mirror.subjectType

let isStringType = typeOfObject == String.self

let a = String.self
a.init(a)
typeOfObject == String.Type.self

String.Type.self
String.Type.self.self.self


infix operator  >>-  {
associativity left
precedence 132
}

func >>- <T,U>(box : Optional<T>, f : T -> Optional<U>) -> Optional<U> {
    return box.flatMap {f($0)}
}

func >>- <T,U>(box : Optional<T>, f : Optional<T -> Optional<U>>) -> Optional<U> {
    return box.flatMap { input in
        f.flatMap { $0(input) }
    }
}

var abc:String? = "10:11"
//abc = nil
if abc?.containsString(":") ?? false {
    abc?.stringByReplacingOccurrencesOfString(":", withString: "點")
    let c = abc >>- {Optional($0 + "分")}
    c
}



true || false








func abcd() {}
let dcba:Void->Void = abcd

let f = { Optional( $0 + 0) }
func yume(inin:String) -> String {
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
    return function(parameter)
}

let kkkkk = yume >>- wrap

"Yo!" >>- kkkkk


//hello(f)
//hello(abcd)

//hello(Void, function: abcd)
hello(1, function: f)
hello(2, function: f)
hello(3, function: f)

hello("Yo!", function: yume)
hello("Oh No~~~", function: yume)

hello((1,2), function: yume2)

hello(abcd)


















//: [Previous](@previous)

import Foundation

var thing = "cars"

let closure = { [thing] in
    print("I love \(thing)")
}

thing = "airplanes"

closure()

//var thing = "cars"
//
//let closure = {
//    print("I love \(thing)")
//}
//
//thing = "airplanes"
//
//closure() // Prints "I love airplanes"


//let abcd:[Int]? = [1,2,3,4]
//abcd![0]


let formmater = NSDateFormatter()
formmater.dateFormat = "HH:mm"
formmater.timeZone = NSTimeZone(forSecondsFromGMT: 8)

if let date = formmater.dateFromString("14:59") {
    date
}

// http://stackoverflow.com/questions/7288671/how-to-set-time-on-nsdate
let string = "14:59"
let locale = NSLocale(localeIdentifier: "zh_TW")
let timeOnlyFormatter = NSDateFormatter()
timeOnlyFormatter.locale = locale
timeOnlyFormatter.dateFormat = "HH:mm"

let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
let today = NSDate()
let todayComps = calendar?.components([.Day,.Month,.Year], fromDate: today)

let comps = calendar?.components([.Hour,.Minute], fromDate: timeOnlyFormatter.dateFromString(string)!)

comps!.day = todayComps!.day;
comps!.month = todayComps!.month;
comps!.year = todayComps!.year;

let mDate = calendar?.dateFromComponents(comps!)

public func getttt(time:String) -> Int {
    let localeTW = NSLocale(localeIdentifier: "zh_TW")
    let timeOnlyFormatter = NSDateFormatter()
    timeOnlyFormatter.locale = localeTW
    timeOnlyFormatter.dateFormat = "HH:mm"
    
    guard
        let targetDateHM = timeOnlyFormatter.dateFromString(time),
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        else {
            return -1
    }
    
    let today = NSDate()
    let todayComps = calendar.components([.Day,.Month,.Year], fromDate: today)
    
    let comps = calendar.components([.Hour,.Minute], fromDate: targetDateHM)
    
    comps.day = todayComps.day;
    comps.month = todayComps.month;
    comps.year = todayComps.year;
    
    guard let targetDate = calendar.dateFromComponents(comps) else {
        return -1
    }
    let diff = Int(targetDate.timeIntervalSinceDate(today))
    return diff >= 0 ? diff : 86400 + diff
}

let aaaaa = getttt("12:00")
let bbbbb = getttt("11:00")
let ccccc = getttt("")

ceil(1.1)
ceil((-0.1))

//["1",nil,"2"].map{return $0}
//["1",nil,"2"].flatMap{return $0}

//
//  RBResizer.swift
//  Locker
//
//  Created by Hampton Catlin on 6/20/14.
//  Copyright (c) 2014 rarebit. All rights reserved.
//

//import UIKit
//
//func RBSquareImageTo(image: UIImage, size: CGSize) -> UIImage {
//    return RBResizeImage(RBSquareImage(image), targetSize: size)
//}
//
//func RBSquareImage(image: UIImage) -> UIImage {
//    let originalWidth  = image.size.width
//    let originalHeight = image.size.height
//
//    var edge: CGFloat
//    if originalWidth > originalHeight {
//        edge = originalHeight
//    } else {
//        edge = originalWidth
//    }
//
//    let posX = (originalWidth  - edge) / 2.0
//    let posY = (originalHeight - edge) / 2.0
//
//    let cropSquare = CGRectMake(posX, posY, edge, edge)
//
//    let imageRef = CGImageCreateWithImageInRect(image.CGImage, cropSquare);
//    return UIImage(CGImage: imageRef!, scale: UIScreen.mainScreen().scale, orientation: image.imageOrientation)
//}
//
//func RBResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
//    let size = image.size
//
//    let widthRatio  = targetSize.width  / image.size.width
//    let heightRatio = targetSize.height / image.size.height
//
//    // Figure out what our orientation is, and use that to form the rectangle
//    var newSize: CGSize
//    if(widthRatio > heightRatio) {
//        newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
//    } else {
//        newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
//    }
//
//    // This is the rect that we've calculated out and this is what is actually used below
//    let rect = CGRectMake(0, 0, newSize.width, newSize.height)
//
//    // Actually do the resizing to the rect using the ImageContext stuff
//    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
//    image.drawInRect(rect)
//    let newImage = UIGraphicsGetImageFromCurrentImageContext()
//    UIGraphicsEndImageContext()
//
//    return newImage
//}



// http://stackoverflow.com/questions/32490837/cgcontextsavegstate-invalid-context-0x0-xcode-7-gm
//: CGContextSaveGState: invalid context 0x0. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable.
//
//: CGContextTranslateCTM: invalid context 0x0. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable.
//
//: CGContextRestoreGState: invalid context 0x0. If you want to see the backtrace, please set CG_CONTEXT_SHOW_BACKTRACE environmental variable.
// removing UIViewControllerBasedStatusBarAppearance from info.plist









