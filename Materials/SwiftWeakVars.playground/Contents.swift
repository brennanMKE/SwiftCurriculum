// SwiftCurriculum: https://github.com/brennanMKE/SwiftCurriculum
// Blog Post: https://medium.com/@brennansv/swift-weak-vars-9aac18751f00#.8itd96der
// Source: http://stackoverflow.com/questions/24016527/strong-and-weak-references-in-swift
// Web Playground: http://swiftlang.ng.bluemix.net/#/repl/511193d50e16fa6d6feed66cc85f042276c1b72591c01bab1f0c502e385ac6a2

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
