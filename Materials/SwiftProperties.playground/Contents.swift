// SwiftCurriculum: https://github.com/brennanMKE/SwiftCurriculum
// Blog Post: https://medium.com/@brennansv/swift-properties-5346f1543cd7#.1l3a3ijpl
// Web Playground: http://swiftlang.ng.bluemix.net/#/repl/1cb4454b58b8e7e351a3ee73f8b6efd4c0f877541edb188c7a0019d48881cb37

// Class with properties which are initialized immediately

class Traveler {

    var name : String = ""
    var place: String = ""
    
    var description: String {
        return "\(name) - \(place)"
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
        return "\(make) \(model) - \(year)"
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

print("Traveler: \(john.description)")
print("Vehicle: \(truck.description)")
