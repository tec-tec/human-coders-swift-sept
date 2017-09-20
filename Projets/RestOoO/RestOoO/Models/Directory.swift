//
//  Directory.swift
//  RestOoO
//
//  Created by Ludovic Ollagnier on 20/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation

class Directory {

    var restaurants = [Restaurant]()

    func add(_ restaurant: Restaurant) {
        restaurants.append(restaurant)
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
