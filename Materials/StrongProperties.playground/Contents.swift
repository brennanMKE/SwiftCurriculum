// SwiftCurriculum: https://github.com/brennanMKE/SwiftCurriculum

// A property in Swift is strong by default. It must be modified to make it weak or unowned.
// With Automatic Reference Counting (ARC) references are counted only if they are strong.
// When a reference count reaches 0 the memory space that is referenced by that property
// is released and all weak references become undefined.

// Below a group of friends are welcomed into a squad and then one is kicked out
// and set to nil. It is immediate de-initialized. Then the variables for the
// rest of the friends are also set to nil but are still retained because the
// array in the squad has a strong reference to each of them.

import UIKit

class Friend {
    let name: String
    init(name: String) { self.name = name }
    deinit { print("\(name) ghosted") }
}

extension Friend: Equatable { }

func ==(lhs: Friend, rhs: Friend) -> Bool {
    return lhs.name == rhs.name
}

class Squad {
    var friends: [Friend]
    
    init() {
        friends = []
    }
    
    func welcomeFriend(friend: Friend?) -> String? {
        guard let friend = friend else {
            return nil
        }
        
        // prevent duplicates?
        if !friends.contains(friend) {
            friends.append(friend)
            return friend.name
        }
        else {
            print ("\(friend.name) is already on the squad")
        }
    
        return nil
    }
    
    func kickOutFriend(friend: Friend?) -> String? {
        guard let friend = friend else {
            return nil
        }
        
        if let index = friends.indexOf({ $0 == friend }) {
            print("Kicking out \(friend.name)")
            friends.removeAtIndex(index)
            return friend.name
        }
        
        return nil
    }
    
    func kickOutFriendByName(name: String) -> String? {
        if let index = friends.indexOf({ $0.name == name }) {
            print("Kicking out \(name)")
            friends.removeAtIndex(index)
            return name
        }
        
        return nil
    }
    
    func report() {
        print("Squad Report")
        print("------------")
        for friend in friends {
            print("\(friend.name)")
        }
        print("------------")
    }
    
    deinit { print("Your squad with \(friends.count) friends ghosted") }
    
}

var taylor: Friend? = Friend(name: "Taylor Swift")
var selena: Friend? = Friend(name: "Selena Gomez")
var emma: Friend? = Friend(name: "Emma Stone")
var jaime: Friend? = Friend(name: "Jaime King")
var lena: Friend? = Friend(name: "Lena Dunham")
var kanye: Friend? = Friend(name: "Kanye West")

var swiftSquad: Squad? = Squad()
swiftSquad?.welcomeFriend(taylor)
swiftSquad?.welcomeFriend(selena)
swiftSquad?.welcomeFriend(emma)
swiftSquad?.welcomeFriend(jaime)
swiftSquad?.welcomeFriend(lena)
swiftSquad?.welcomeFriend(kanye)

// set each friend to nil
kanye = nil
lena = nil
emma = nil
jaime = nil
selena = nil
taylor = nil

swiftSquad?.report()

// kick out Kanye
swiftSquad?.kickOutFriendByName("Kanye West")

// Kanye is not in the squad so there is only 1 reference to this variable now

swiftSquad?.report()

// making the squad nil should release the rest of the friends

swiftSquad = nil
