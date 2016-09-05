//: [Previous](@previous)

import Foundation

let jsonFile = [#FileReference(fileReferenceLiteral: "SwiftyJSONTests.json")#]
if let data = NSData(contentsOfURL: jsonFile) {
    let jsonObj = JSON(data: data)
    jsonObj[0]["yume"].int
    jsonObj[0]["yume"].intValue
    print(jsonObj[0]["yume"].int)
}



//if let file = NSBundle(forClass:AppDelegate.self).pathForResource("SwiftyJSONTests", ofType: "json") {
//    let data = NSData(contentsOfFile: file)!
//    let json = JSON(data:data)
//    viewController.json = json
//} else {
//    viewController.json = JSON.null
//}
