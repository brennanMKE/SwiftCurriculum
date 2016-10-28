// SwiftCurriculum: https://github.com/brennanMKE/SwiftCurriculum
// Blog Post: https://medium.com/swift-curriculum/swift-weak-vars-9aac18751f00
// Swift Version: 3.0

// A weak var allows for preventing circular references which would result in memory leaks.
// Below a person can have a reference to an apartment and an apartment has a tentant
// property referencing a person.

class Person {
    let name: String
    var apartment: Apartment?
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let number: Int
    weak var tenant: Person?
    init(number: Int) { self.number = number }
    deinit { print("Apartment #\(number) is being deinitialized") }
}

var person: Person? = Person(name: "Tim")
var apartment: Apartment? = Apartment(number: 101)

// set apartment in person to the apartment
person?.apartment = apartment

// set the tenant with the optional value for person
apartment?.tenant = person

// now there are weak references between both variables

// clear person value which is a weak reference in apartment
person = nil

// show that person is now nil because it is a weak var
apartment?.tenant

// clear out apartment
apartment = nil
