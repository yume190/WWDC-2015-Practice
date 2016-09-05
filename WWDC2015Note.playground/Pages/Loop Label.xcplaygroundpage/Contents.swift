//: [Previous](@previous)

import Foundation

let sections = [1,2]
let rows = [1,2]

for section in sections {
    var foundTheMagicalRow = false
    for row in rows {
//        if row.isMagical {
//            foundTheMagicalRow = true
//            break
//        }
        if row == 1 {
            break
        }
    }
    if foundTheMagicalRow {
        //We found the magical row!
        //No need to continue looping through our sections now.
        break
    }
}

sectionLoop: for section in sections {
    rowLoop: for row in rows {
//        if row.isMagical {
//            break sectionLoop
//        }
        if row == 1 {
            print("oh no~")
            break sectionLoop
        }
    }
}