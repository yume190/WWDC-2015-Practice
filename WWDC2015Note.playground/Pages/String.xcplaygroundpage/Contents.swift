import Foundation

// https://developer.apple.com/swift/blog/?id=30

var letters: [Character] = ["c", "a", "f", "e"]
var string: String = String(letters)

print(letters.count) // 4
print(string) // cafe
print(string.characters.count) // 4

let acuteAccent: Character = "\u{0301}" // ´ COMBINING ACUTE ACCENT' (U+0301)

string.append(acuteAccent)
print(string.characters.count) // 4
print(string.characters.last!) // é

string.characters.contains("e") // false
string.characters.contains("´") // false
string.characters.contains("é") // true

let ᄀ = "\u{1100}"
let ᅡ = "\u{1161}"
let 가 = ᄀ + ᅡ
let decomposed = "\u{1100}\u{1161}" // ᄀ + ᅡ
let precomposed = "\u{AC00}" // 가

decomposed == precomposed // true

var e = "e" + "\u{0301}"

//: [Next](@next)
