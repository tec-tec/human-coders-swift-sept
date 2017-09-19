//: Playground - noun: a place where people can play

import UIKit

//: # Variables

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

//: Classes et structures

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

var aCat = Cat(name: "Félix2", age: 10, isKind: true)
let aCat2 = aCat
aCat.name = "Miaou"

// 2 différences : Héritage & comportement mémoire
// Seule les classes héritent (héritage simple)

//: # Fonctions et méthodes

func uneFonction() {

}
uneFonction()

struct Aliment {

}

//: ## Nommage des paramètres
func manger(_ aliment: Aliment, avec ami: String) {

    print(aliment)
    print(ami)
}

let sushi = Aliment()
manger(sushi, avec: "Paul")

//:  ## Valeurs par défaut

struct Boisson {

    var name: String
}

func boire(_ boisson: Boisson = Boisson(name: "Coca")) {

}

//: ## Retours
func uneFonctionavecRetour() -> String {

    return ""
}

func uneFonctionAvecPlusieursRetours() -> (String, Int, Bool) {
    return ("string", 42, false)
}

func getSomething(at: String) -> (message: String, code: Int, isOK: Bool) {

    return ("OK", 200, true)
}

let result = getSomething(at: "")
result.message

let unTuple = (12, "Test", false)

//: # Controle de flux

//: ## Boucles

for i in "Hello World" {
    print(i)
}

for _ in 0...100 {
    uneFonction()
}

while false {
    //Do somthing
}

repeat {

} while false

//: ## Conditions

// if/else, switch/case

var x = true
if x == true {

} else {

}

// guard

guard x == true else { fatalError("x should be true") }

//: # Types standards

//: ## Strings

//: ## Tableaux
var tab: [String] = ["Anna", "Bob", "John"]
var tab2: Array<String> = ["Anna", "Bob", "John"]

tab.append("Test")

//Recup
tab[2]

// Modif
tab[2] = "Jane"

// Array slice
let subTab = tab[0...3]

// 0 à 2 inclus
tab[0...2] = ["Jean", "Claude", "Robert"]

// 0 à 2 exclus
tab[0..<2]

// Intervalles semi ouverts (Swift 4 uniquement)
tab[2...]
tab[...2]

var tabVide = [String]()
var tabVide2: [String] = []

for truc in tab.enumerated() {

}

//: ## Dictionnaires

var nbHabitants = ["Paris" : 2250000, "Bordeaux" : 239000, "Lyon" : 491268, "Marseille" : 850636]

nbHabitants["Paris"]
nbHabitants["Nantes"] = 10

nbHabitants["Nantes"] = nil
nbHabitants.removeValue(forKey: "Paris")

//: ## Ensembles


//: # Optionnels

// Optionnel avec type précisé (syntaxe "shorthand")
let nbHabNantes: Int? = nbHabitants["Paris"]

// Optionnel avec type précisé (syntaxe "normal")
let nbHabNantes2: Optional<Int> = nbHabitants["Nantes"]

// Syntaxe if-let (récupère/teste/déballe)
if let nbHabParis = nbHabitants["Paris"] {
    nbHabParis * 2
}

// Syntaxe guard-let
guard let nbHabBdx = nbHabitants["Bordeaux"] else { fatalError() }
nbHabBdx * 2

// nil coalescing operator (valeur de défaut)
let nbHabLyon = nbHabitants["Lyon"] ?? 10

struct Owner {
    var name: String
    var cats: [Cat]?
    var dogs: [Dog]?
}

// Optional chaining
let me = Owner(name: "Ludovic", cats: [Cat()], dogs: nil)
guard let catName = me.cats?.first?.name else { fatalError("No cats") }

//: # Enum

// With raw values
enum PaymentMode: String {
    case creditCard = "Carte de crédit"
    case 💶
    case check = "Chèques"
}

let acceptedPayemnts: Set<PaymentMode> = [.check, .creditCard, .💶]
for p in acceptedPayemnts {
    print(p.rawValue)
}

let wsString = "Chèques"
if let payment = PaymentMode(rawValue: wsString) {
    payment
}
