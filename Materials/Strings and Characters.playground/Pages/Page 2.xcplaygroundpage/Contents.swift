// SwiftCurriculum: https://github.com/brennanMKE/SwiftCurriculum
// Blog Post: https://medium.com/swift-curriculum/swift-strings-and-characters-b51ff3cb069

//: [Previous](@previous)

import Foundation

func extractCharacters(string: String) -> [Int8] {
    var characters: [Int8] = []

    let data: NSData = string.data(using: String.Encoding.utf8)! as NSData
    let bytes: UnsafePointer<Int8> = unsafeBitCast(data.bytes, to: UnsafePointer<Int8>.self)

    var currentChar: Int8
    var position: Int = 0
    repeat {
        currentChar = bytes[position]
        characters.append(currentChar)
        position += 1
    } while position < data.length

    return characters
}

func printChars(string: String) {
    let characters = extractCharacters(string: string)
    print("String is \(string.characters.count) characters long")
    print("There are \(characters.count) extracted characters")
    for character in characters {
        print("Character: \(character)")
    }
}

print("UPPERCASE")
printChars(string: "ABCDEFGHIJKLMNOPQRSTUVWXYZ")
print("lowercase")
printChars(string: "abcdefghijklmnopqrstuvwxyz")
print("Emojis")
let emojis = "😎😉😖🚀⏰🏈♻︎"
printChars(string: emojis)

var index = emojis.startIndex
while index != emojis.endIndex {
    let character = emojis[index]
    print("\(index): \(character)")
    printChars(string: "\(character)")
    index = emojis.index(index, offsetBy: 1)
}

//: [Next](@next)
