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

        NotificationCenter.default.post(name: Notification.Name("modelUpdated"), object: self, userInfo: ["restoName":restaurant.name])
    }

    func list() -> [Restaurant] {
        return restaurants
    }

    func remove(_ restaurant: Restaurant) {
        guard let index = restaurants.index(of: restaurant) else { return }
        remove(at: index)
    }

    func remove(at index: Int) {
        let r = restaurants.remove(at: index)
        NotificationCenter.default.post(name: Notification.Name(Constants.NotificationNames.modelUpdated), object: self, userInfo: ["restoName":r.name])
    }

    static func demoDirectory() -> Directory {
        let d = Directory()
        d.generateDemoData()
        return d
    }

    func generateDemoData() {
        for i in 0...10 {
            let randNote = Int(arc4random_uniform(5))
            let r = Restaurant(name: "Resto \(i)", address: "Adresse \(i)", styles: [], note: randNote, accessible: false)
            add(r)
        }
    }
}
