// SwiftCurriculum: https://github.com/brennanMKE/SwiftCurriculum
// Blog Post: https://medium.com/@brennansv/swift-lazy-properties-dd76584d2d90#.jyflzxi4n
// Web Playground: http://swiftlang.ng.bluemix.net/#/repl/44427dbfd6a1d778fc7ed6b7e330ab00dda27a0e2d49f4965e86c462966c4645

class Person {
    let name: String
    var apartment: Apartment? {
        didSet(oldApartment) {
            if let apartment = apartment {
                // apartment is defined
                if apartment.tenant != self {
                    apartment.tenant = self
                }
            }
            else {
                // apartment is now nil
                if let oldApartment = oldApartment {
                    oldApartment.tenant = nil
                }
            }
        }
    }
    init(name: String) { self.name = name }
    deinit { print("\(name) is being deinitialized") }
}

extension Person: Equatable { }

func ==(lhs: Person, rhs: Person) -> Bool {
    return lhs.name == rhs.name
}

class Apartment : Hashable {
    let number: Int
    let name: String
    var hashValue: Int {
        get {
            return name.hashValue
        }
    }
    weak var tenant: Person? {
        didSet(oldTenant) {
            if let tenant = tenant {
                // tenant is defined
                if tenant.apartment != self {
                    tenant.apartment = self
                }
            }
            else {
                // tenant is nil
                if let oldTenant = oldTenant {
                    oldTenant.apartment = nil
                }
            }
        }
    }
    init(name: String, number: Int) {
        self.name = name
        self.number = number
    }
    deinit { print("Apartment #\(number) is being deinitialized") }
}

extension Apartment: Equatable { }

func ==(lhs: Apartment, rhs: Apartment) -> Bool {
    return lhs.name == rhs.name && lhs.number == rhs.number
}

class ApartmentBuilding {
    let name: String
    lazy var units : Set<Apartment> = {
        print("Lazily creating units now")
        var units : Set<Apartment> = Set<Apartment>()
        for floor in [100, 200, 300] {
            for unit in 1...20 {
                let number = floor + unit
                let apartment = Apartment(name: self.name, number: number)
                units.insert(apartment)
            }
        }
        return units
    }()
    var availableUnits : Set<Apartment> {
        var units : Set<Apartment> = Set<Apartment>()
        for unit in self.units {
            if unit.tenant == nil {
                units.insert(unit)
            }
        }
        return units
    }
    var availableUnitsCount : Int {
        return availableUnits.count
    }

    init(name: String) { self.name = name }

    func getUnit(number: Int) -> Apartment? {
        for unit in self.units {
            if unit.number == number {
                return unit
            }
        }
        return nil
    }
}

print ("Before creating the instances")

var person = Person(name: "Gerry")
let apartmentBuilding = ApartmentBuilding(name: "Mission Ridge")

print ("After creating the instances")

print("There are \(apartmentBuilding.availableUnitsCount) available at \(apartmentBuilding.name)")

if let unit305 = apartmentBuilding.getUnit(305) {
    print("\(person.name) moved into \(unit305.number) at \(apartmentBuilding.name)")
    person.apartment = unit305
}

print("There are \(apartmentBuilding.availableUnitsCount) available at \(apartmentBuilding.name)")
