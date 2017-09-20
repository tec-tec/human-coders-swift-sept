//
//  Restaurant.swift
//  RestOoO
//
//  Created by Ludovic Ollagnier on 20/09/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation

struct Restaurant: Hashable {

    enum Style: String {
        case japanese
        case french
        case burger
        case vegan

        static var all: [Style] {
            return [.japanese, .french, .burger, .vegan]
        }

        init?(allIndex: Int) {
            switch allIndex {
            case 0:
                self = .japanese
            case 1:
                self = .french
            case 2:
                self = .burger
            case 3:
                self = .vegan
            default:
                return nil
            }
        }
    }
    
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
