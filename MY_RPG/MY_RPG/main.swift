//
//  main.swift
//  MY_RPG
//
//  Created by clément czl on 11/01/2020.
//  Copyright © 2020 ATCEntertainement. All rights reserved.
//

// Fonction permettant de demander à l'utilisateur d'entrer un nombre entier
func input() -> Int {
    let strData = readLine();
    
    return Int(strData!)!
}

func pseudos() -> String{
    let strData = readLine()
    return String(strData!)
}

// Variables qui serviront à déterminer les choix des deux joueurs
var choixUtilisateur1: Int
var choixUtilisateur2: Int
var j1: String
var j2: String

// On demande quel type de personnage les joueurs veulent être
repeat {
    print("Classe du personnage 1 :")
    print("1. Archer")
    print("2. Guerrier")
    print("3. Mage")
    choixUtilisateur1 = input()
    print("Entrez votre pseudos : ")
    j1 = pseudos()
} while choixUtilisateur1 != 1 && choixUtilisateur1 != 2 && choixUtilisateur1 != 3

print()

repeat {
    print("Classe du personnage 2 :")
    print("1. Archer")
    print("2. Guerrier")
    print("3. Mage")
    choixUtilisateur2 = input()
    print("Entrez votre pseudos : \n")
    j2 = pseudos()
} while choixUtilisateur2 != 1 && choixUtilisateur2 != 2 && choixUtilisateur2 != 3

// Grâce à l'énumération Classe, on va pouvoir préciser la classe des personnages des joueurs
var classe1: Classe!
switch choixUtilisateur1 {
case 1:
    classe1 = .Archer
case 2:
    classe1 = .Guerrier
case 3:
    classe1 = .Mage
default:
    break
}

var classe2: Classe!
switch choixUtilisateur2 {
case 1:
    classe2 = .Archer
case 2:
    classe2 = .Guerrier
case 3:
    classe2 = .Mage
default:
    break
}

// Création des deux personnages
// Grâce au constructeur, tout est initialisé déjà (vie et arme)
var personnage1 = Personnage(nom: "\(j1)\n", classe: classe1)
var personnage2 = Personnage(nom: "\(j2)\n", classe: classe2)

// On joue tant que les deux personnages sont en vie
while personnage1.vie > 0 && personnage2.vie > 0 {
    personnage1.jouer(contre: personnage2)
    
    // Cette condition permet de ne pas faire jouer le deuxième personnage s'il est mort
    if personnage2.vie > 0 {
        personnage2.jouer(contre: personnage1)
    }
}

// On trouve le vainqueur
var nomVainqueur: String

if personnage1.vie > 0 {
    nomVainqueur = personnage1.nom
} else {
    nomVainqueur = personnage2.nom
}

// On l'affiche !
print("Le vainqueur est " + nomVainqueur + " !")
