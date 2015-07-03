import Foundation

//: Repeat Page 13
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)


//: Option set
// Custom Option set
struct YumeStyle:OptionSetType {
    let rawValue:Int
    static let Long     = YumeStyle(rawValue: 1 << 0)
    static let Short    = YumeStyle(rawValue: 1 << 1)
    static let Happy    = YumeStyle(rawValue: 1 << 2)
    static let Unhappy  = YumeStyle(rawValue: 1 << 3)
}
// Usage
var dreamOptions:[YumeStyle] = [.Long,.Happy]
if dreamOptions.contains(.Happy) {
    print("happy")
}

//: Guard
func useGuard(firstItem:Int?,secondItem:Int?) -> Int {
    guard let first = firstItem else {
        return 1
    }
    
    guard let second = secondItem else {
        return 2
    }
    
    return first + second
}

useGuard(nil, secondItem: 1)
useGuard(1, secondItem: nil)
useGuard(2, secondItem: 3)

//: Pattern Match
// 空

//: Error Handle
// session 106 & 401

// 自定義 error
@objc enum YumeError:Int, ErrorType {
    case Nightmare = 666
    case Break = 404
    case BlackHole = 0
}

/*:
### 對應的 Objc Code

    typedef NS_ENUM(NSInteger,YumeError) {
        YumeErrorNightmare = 666
        YumeErrorBreak = 404
    };
    static NSString * const YumeErrorDomain = @"...";
*/

func dreamStart(code:Int){
    do {
        // 用 try 呼叫可能會發生 error 的 func
        try dreaming(code)
    } catch YumeError.Nightmare {
        print("可怕")
    } catch is YumeError {
        print("Yume Error")
    } catch let error {
        print(error)
    }
}

// dreaming 可能會發出 error
func dreaming(code:Int) throws {
    if code == 404 {
        // 實際丟出 error
        throw YumeError.Break
    }
    
    if code == 666 {
        throw YumeError.Nightmare
    }
    
    if code == 0 {
        // 沒有被 do-catch 的 try func 會透過 throws 再丟出去
        try dreamBlackHole()
    }
    
    throw NSCocoaError.CoderReadCorruptError
}

func dreamBlackHole(hasBlackHole:Bool = true) throws {
    if hasBlackHole {
        throw YumeError.BlackHole
    }
    
}

dreamStart(0)
dreamStart(1)
dreamStart(404)
dreamStart(666)

//: try! 會停止傳播 error，但是，如果真的發生 error 你會拿到 runtime error
try! dreamBlackHole(false)
//try! dreamBlackHole()


//: defer

func gotoBed(hasBlackHole:Bool = true){
    defer {
        print("下床")
    }
    do{
        try dreamBlackHole(hasBlackHole)
    } catch let error {
        print(error)
    }
}

gotoBed(false)
gotoBed()


//: [Previous](@previous) | [Next](@next)
