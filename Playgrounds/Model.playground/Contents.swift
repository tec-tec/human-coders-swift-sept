//: Playground - noun: a place where people can play

import UIKit

enum Style {
    case japanese
    case french
    case burger
    case vegan
}

struct Restaurant: Hashable {

    var hashValue: Int {
        return (name+address).hashValue
    }

    static func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.name == rhs.name && lhs.address == rhs.address
    }

    var name: String
    var address: String
    var styles: Set<Style>
}

class Directory {

    var restaurants = [Restaurant]()

    func add(_ restaurant: Restaurant) {

    }

    func list() -> [Restaurant] {
        return restaurants
    }

    func remove(_ restaurant: Restaurant) {
        guard let index = restaurants.index(of: restaurant) else { return }
        remove(at: index)
    }

    func remove(at index: Int) {
        restaurants.remove(at: index)
    }
}

let r = Restaurant(name: "Toto", address: "Titit", styles: [])

print(r.hashValue)

var dir = Directory()
dir.restaurants
