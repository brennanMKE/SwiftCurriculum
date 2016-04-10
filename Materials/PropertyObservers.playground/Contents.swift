// SwiftCurriculum: https://github.com/brennanMKE/SwiftCurriculum
// Blog Post: https://medium.com/@brennansv/swift-property-observers-51f3e4fe7d3f#.cwmu4okhz

class Person {
    let name: String
    var apartment: Apartment? {
        willSet(newApartment) {
            if apartment != newApartment {
                print("### apartment will change")
            }
        }
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
            
            if apartment != oldApartment {
                print("\(status)")
                if oldApartment != nil &&
                    apartment?.number > oldApartment?.number {
                    print("This apartment is much better!")
                }
            }
        }
    }
    var status: String {
        get {
            if let apartment = apartment {
                return "\(name) lives in unit \(apartment.number) at \(apartment.name)"
            }
            else {
                return "\(name) has no apartment"
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

class Apartment {
    let number: Int
    var name: String
    weak var tenant: Person? {
        willSet(newTenant) {
            if tenant != newTenant {
                print("### tenant will change")
            }
        }
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
            if tenant != oldTenant {
                print("\(status)")
            }
        }
    }
    var status: String {
        get {
            if let tenant = tenant {
                return "Unit \(number) at \(name) is occupied by \(tenant.name)"
            }
            else {
                return "Unit \(number) at \(name) is available"
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

var tenant: Person? = Person(name: "Bianca")
var apartment: Apartment? = Apartment(name: "100 Van Ness", number: 101)

// set the tenant for the apartment
apartment?.tenant = tenant

// clear the tenant for the apartment
apartment?.tenant = nil

// set the apartment for the tenant
tenant?.apartment = apartment

// clear the aparment for the tenant
tenant?.apartment = nil

// set apartment for tentant
tenant?.apartment = apartment

// change apartment for tenant
var anotherApartment: Apartment? = Apartment(name: "100 Van Ness", number: 301)
tenant?.apartment = anotherApartment

// clear the tenant for another apartment
anotherApartment?.tenant = nil

// clear apartment for tenant
tenant?.apartment = nil

print("Bianca has a house now and lived happily ever after")

///////////////////////////////////////////////////////////////////

// global and local properties can also have observers

var name: String = "" {
    willSet {
        print("name will be set to \(newValue)")
    }
    didSet {
        print("name was set from \(oldValue) to \(name)")
    }
}

name = "Tim"
name = "Eliza"
name = "Mattt"
name = "Bill"
