import Foundation

struct Person {
    let name:String
    init (name:String) {
        self.name = name
    }
}

//: # Category Theory

//: Objects A B C D
//: A:Int
//: B:Double
//: C:String
//: D:Person

//: Arrows f g h
//: f:A -> B
//: g:B -> C
//: h:C -> D

func f(a:Int) -> Double {
    return Double(a + 1)
}

func g(b:Double) -> String {
    return String(b) + "2"
}

func h(c:String) -> Person {
    return Person(name: c)
}

// Identity Law
// id_A • f = f = f • id_B
let input = 10
let leftID = (IDENTITY • f)(input)
let middleID = f(input)
let rightID = (f • IDENTITY)(input)
leftID == middleID && middleID == rightID && leftID == rightID

// Associative Law
// (f • g) • h = f • (g • h)
let leftCompose = (h • g) • f
let rightCompose = h • (g • f)
leftCompose(input).name
rightCompose(input).name
leftCompose(input).name == rightCompose(input).name

// -------------------------------------------------------------------------------------------------------

//: # Functor

// Composition Law
// F(g • f) = F(g) • F(f)
let Ff = Optional(f)
let Fg = Optional(g)
let Fgof = Optional(g • f)
let FgoFf = Fg • Ff
Fgof!(input)
FgoFf!(input)
Fgof!(input) == FgoFf!(input)

let Ff2 = [f]
let Fg2 = [g,g]
let Fgof2 = [g • f,g • f]
let dddd = Fgof2.map{$0(input)}
dddd
//let FgoFf2 = Fg2 • Ff2


// Identity Law
// F(id_A) = id_F(A)
let Fid_A = Optional(IDENTITY(input))
let id_FA = IDENTITY(Optional(input))
Fid_A == id_FA








var a:String? = "test"
a?.characters.count
a = nil
a?.characters.count










