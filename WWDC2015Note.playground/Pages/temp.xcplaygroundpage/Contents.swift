//: [Previous](@previous)

import Foundation

infix operator =~ {
associativity none
precedence 130
}

infix operator ==~ {
associativity none
precedence 130
}

public func =~ (lhs: String, rhs: String) -> Bool {
    return RegexHelper(rhs).match(lhs)
}

public func ==~ (lhs: String, rhs: String) -> [String] {
    return RegexHelper(rhs).match2(lhs)
}

struct RegexHelper {
    var regex: NSRegularExpression? = nil
    
    init(_ pattern: String) {
        do {
            regex = try NSRegularExpression(pattern: pattern,
                options: .CaseInsensitive)
        } catch let error {
            print(error)
        }
    }
    
    func match(input: String) -> Bool {
        if let matches = regex?.matchesInString(input, options: [], range: NSMakeRange(0, input.characters.count)) {
            return matches.count > 0
        } else {
            return false
        }
    }
    
    func match2(input: String) -> [String] {
        if let matches = regex?.matchesInString(input, options: [], range: NSMakeRange(0, input.characters.count)) {
            let s:NSString = input as NSString
            return matches.map { s.substringWithRange($0.range) }
        } else {
            return []
        }
    }
}

func comp(o1:String,_ o2:String) -> Bool {
    //    print("\(o1):\(o2) \(o1.compare(o2).rawValue <= 0 ? true : false)")
    return o1.compare(o2).rawValue <= 0 ? true : false
}

func _routeSort(routes:[String]) -> [String] {
    let r = routes.map { (route:String) -> (String,String,String,String) in
        let ii:(String,String) = { () -> (String,String) in
            let numbers = route ==~ "\\d+"
            if numbers.count >= 2 {
                return (numbers[0],numbers[1])
            } else if numbers.count == 1 {
                return (numbers[0],"")
            } else {
                NSLog("route 名稱怪怪的")
                return ("","")
            }
        }()
        let strs = route ==~ "[^\\d]+"
        let str = strs.count > 0 ? strs[0] : ""
        
        return (route,ii.0,ii.1,str)
        }.filter { (route:String, i1:String, i2:String, s:String) -> Bool in
            return (i1 != "" || i2 != "")
        }.sort { (l:(route:String, i1:String, i2:String, s:String), r:(route:String, i1:String, i2:String, s:String)) -> Bool in

            let r1 = l.i1.compare(r.i1).rawValue
            let r1b = r1 <= 0 ? true : false
            if r1 != 0 {
                return r1b
            }
            
            let r2 = comp(l.i2, r.i2)
            let r3 = { () -> Bool in
                if l.s == "" && r.s == "" {
                    return true
                } else if l.s == "" {
                    return true
                } else if r.s == "" {
                    return false
                }
                return comp(l.s, r.s)
            }()
            return
                r1b &&
                r2 &&
                r3
    }
    return r.map { $0.0 }
}
let aaaaaaaaaa = [1,2].sort { (a:Int, b:Int) -> Bool in
    return true
}
aaaaaaaaaa
let aaaaaaaaaa2 = [1,2].sort(<)
aaaaaaaaaa2



_routeSort(["15","142"])
_routeSort(["142","15"])

_routeSort(["142","14"])
_routeSort(["14","142"])

_routeSort(["14x","14"])
_routeSort(["14","14x"])
_routeSort(["14副", "14"])
_routeSort(["14", "14副"])

_routeSort(["14副", "13"])
_routeSort(["13", "14副"])

_routeSort(["14x","142"])
_routeSort(["142","14x"])

_routeSort(["14副", "15咪"])
_routeSort(["15咪", "14副"])

_routeSort(["151","14區1"])
_routeSort(["14區1","151"])



_routeSort(["142","14","14副","14延"])
_routeSort(["14副","14延","142","14"])


var list1 = ["15","142"]
//var list1 = ["14副","14延","142","14"]
var list3 = ["142","14","14副","14延"]
var list2 = ["151","15咪","14區1","14區2","142","14","14副","14延","15","152"]
var list4 = ["14區1","14區2","142","14","14副","14延"]
print(_routeSort(list2))
print(_routeSort(["14區1","14區2","142","14","14副","14延"]))
print(_routeSort(["14區1","14區2","14延","142","14","14副"]))
print(_routeSort(["14區1","14區2","14","14副","14延","142"]))

"142".compare("15").rawValue
"14".compare("142").rawValue
"14".compare("14x").rawValue

"14x".compare("142").rawValue

"14".compare("142").rawValue
"x".compare("").rawValue


1 & -1 & 0

