//: Playground - noun: a place where people can play

import UIKit

/// # Variables

//Variables fortement typées
var str = "Hello, playground"
//str = 5

var anInt = 3
//anInt = 2.3

// Inférence du type
// Precise le type uniquement en cas d'ambiguité ou volonté de préciser
var uneString: String = "Texte"
var virgule: Float = 3.0

var uneVar: Bool

if true {
    uneVar = true
} else {
    uneVar = false
}

// Favoriser les Constantes
let languageName = "Swift"
//languageName = "ObjC"

//: Classes

class Dog {
    var name = "Médor"
    var age = 0
    var isKind = false
}

let aDog = Dog()
let aDog2 = aDog
aDog.name = "Brutus"
print(aDog)

struct Cat {
    var name = "Félix"
    var age = 0
    var isKind = false
}

var aCat = Cat()
let aCat2 = aCat
aCat.name = "Miaou"

// 2 différences : Héritage & comportement mémoire
// Seule les classes héritent (héritage simple)







