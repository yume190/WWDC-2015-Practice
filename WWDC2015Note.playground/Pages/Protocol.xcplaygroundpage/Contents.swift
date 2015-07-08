import Foundation

//: [The Ghost of Swift Bugs Future](http://nomothetis.svbtle.com/the-ghost-of-swift-bugs-future)

protocol Formattable {
    /// A string.
    var content:String { get }
    
    /// An formatting function.
    func formattedContent() -> String
    
    func mF() -> String
    
//    func debugFormattedContent() -> String
}

extension Formattable {
    func debugFormattedContent() -> String {
        return "Content: \(self.content)"
    }
    
    func mF() -> String {
        return "a"
    }
}

struct Day : Formattable {
    
    var content:String
    
    func formattedContent() -> String {
        return "Today is \(self.content)"
    }
    
    func debugFormattedContent() -> String {
        return "Day: \(self.content)"
    }
    
    func mF() -> String {
        return "b"
    }
}

struct Day2 : Formattable {
    
    var content:String
    
    func formattedContent() -> String {
        return "Today2 is \(self.content)"
    }
}

let a = Day(content:"Monday")
let b:Formattable = Day(content:"Monday")
let c = Day2(content:"Monday")
let d:Formattable = Day2(content:"Monday")

a.formattedContent()
b.formattedContent()
c.formattedContent()
d.formattedContent()

//: Protocol 未定義 debugFormattedContent 方法，直接在 Protocol Extension 實作
a.debugFormattedContent()
b.debugFormattedContent()
c.debugFormattedContent()
d.debugFormattedContent()

//: Protocol 先定義 mF 方法，在 Protocol Extension 實作
a.mF()
b.mF()
c.mF()
d.mF()

let aa:[Formattable] = [a,b,c,d]
aa.map{$0.formattedContent()}

aa.map{$0.debugFormattedContent()}

aa.map{$0.mF()}




b.debugFormattedContent()//: [Previous](@previous) | [Next](@next)
