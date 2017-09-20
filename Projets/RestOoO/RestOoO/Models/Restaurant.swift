//
//  Restaurant.swift
//  RestOoO
//
//  Created by Ludovic Ollagnier on 20/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation

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
    var note: Int
    var accessible: Bool
}
