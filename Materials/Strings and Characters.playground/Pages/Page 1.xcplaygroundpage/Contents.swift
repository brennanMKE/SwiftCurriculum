// SwiftCurriculum: https://github.com/brennanMKE/SwiftCurriculum
// Blog Post: https://medium.com/swift-curriculum/swift-strings-and-characters-b51ff3cb069

import Foundation

let str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

print("Character Count: \(str.characters.count)")
print("Start Index: \(str.startIndex)")
print("End Index: \(str.endIndex)")

var index = str.startIndex

while index != str.endIndex {
    let character = str[index]
    print("\(index): \(character)")
    index = str.index(index, offsetBy: 1)
}

//: [Next](@next)
