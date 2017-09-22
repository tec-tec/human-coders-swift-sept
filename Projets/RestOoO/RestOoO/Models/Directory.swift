//
//  Directory.swift
//  RestOoO
//
//  Created by Ludovic Ollagnier on 20/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation

class Directory: Codable {

    var restaurants = [Restaurant]()

    func add(_ restaurant: Restaurant) {
        restaurants.append(restaurant)

        NotificationCenter.default.post(name: Notification.Name(Constants.NotificationNames.modelUpdated), object: self, userInfo: ["restoName":restaurant.name])

        save()
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

    static func dirFromSave() -> Directory {
        let dataURL = documentDirectoryUrl.appendingPathComponent("backup.json")
        guard let data = try? Data(contentsOf: dataURL) else { return Directory.demoDirectory() }

        guard let dir = try? JSONDecoder().decode(Directory.self, from: data) else { return Directory.demoDirectory() }

        return dir
    }

    private func save() {
        guard let jsonData = try? JSONEncoder().encode(self) else { return }
        guard let jsonString = String(data: jsonData, encoding: .utf8) else { return }
        print(jsonString)

        let dataURL = Directory.documentDirectoryUrl.appendingPathComponent("backup.json")
        do {
            try jsonData.write(to: dataURL)
        } catch {
            print(error)
        }
    }

    static var documentDirectoryUrl: URL = {
        let fileManager = FileManager.default
        let url = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first
        return url!
    }()

}
