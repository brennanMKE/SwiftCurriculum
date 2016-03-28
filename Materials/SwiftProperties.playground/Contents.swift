//: Playground - noun: a place where people can play

import UIKit

// Class with properties which are initialized immediately

class Traveler {

    var name : String = ""
    var place: String = ""
    
    var description: String {
        return String(format: "\(name) - \(place)", arguments: [unsafeAddressOf(self)])
    }
    
    var debugDescription: String {
        return self.description
    }
}


// Class with properties which are initialized with init function

class Vehicle {

    var make: String
    var model: String
    var year: Int
    
    init(make: String, model: String, year: Int) {
        self.make = make
        self.model = model
        self.year = year
    }
    
    var description: String {
        return String(format: "\(make) \(model) - \(year)", arguments: [unsafeAddressOf(self)])
    }
    
    var debugDescription: String {
        return self.description
    }
}

let john = Traveler()
john.name = "John"
john.place = "Sunnyvale"

let truck = Vehicle(make: "Toyota", model: "Tacoma", year: 2004)

// Note: The description is not expanded automatically in a print statement.

print("Traveler: \(john)")
print("Vehicle: \(truck)")

print("Traveler: \(john.description)")
print("Vehicle: \(truck.description)")
