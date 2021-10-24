//
//  ViewController.swift
//  NASSER_ASEERI
//
//  Created by Nasser Aseeri on 18/03/1443 AH.
//

import UIKit

struct power {
        var name: String
        var damage: Int
        var specialEffect: Int
    
    func attackWithPower() {
        print("he Hero use \(name) power and inflict \(damage)")
        }
}

struct Weapon {
        var name: String
        var damage: Int
    func attackWithWeapon() {
        print("The Hero use \(name) weapon and inflict \(damage)")
    }
}
//===============😎 class Hero 😎====================

class Hero {
    var name: String
    var charact: String
    var level: Int
    var lifePoint: Int
    var healPlus: Int
    
    init(name: String, charact: String, level: Int, lifePoint: Int, healPlus: Int) {
        self.name = name
        self.charact = charact
        self.level = level
        self.lifePoint = lifePoint
        self.healPlus = healPlus
    }
    
    func heal() {
        lifePoint += healPlus
        print("The Hero \(name) has healed \(healPlus) point of life")
    }
    
}
//=============== class hero 2 =======================

class Knight: Hero {
    
    func restOfLife() {
        if lifePoint < 0 {
            lifePoint = 0
        }
        print("Rest of life point for Lazarus : \(lifePoint)")
    }
}
class Wizard: Hero {
    func restOfLife() {
        if lifePoint < 0 {
            lifePoint = 0
        }
        print("Rest of life for Elvin : \(lifePoint)")
    }
    
}

//===================================== كلاس النرد

class ViewController: UIViewController {
    
  
    var turn: Int = 0
    var winner = false
    
    var lazarus = Knight(name: "Lazarus", charact: "Knight", level: 90, lifePoint: 160, healPlus: 10)
    var elvin = Wizard(name: "Elvin", charact: "Wizard", level: 90, lifePoint: 140, healPlus: 15)
    
    var lazarusWeapon = Weapon(name: "Sword Attack", damage: 10)
    var lazarusPower = power(name: "Mage Fist", damage: 30, specialEffect: 2)
    
    var elvinWeapon = Weapon(name: "Stick of the Wise", damage: 15)
    var elvinPower = power(name: "Fire Ball", damage: 20, specialEffect: 10)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    
    @IBAction func rollingDice(_ sender: UIButton) {
        
        turn += 1
        if winner {
            print("Game Over ! ")
        }
        else {
            print("------- This is the turn N°\(turn)--------")
            logicOfTheGame()
            print("============== This is the end of turn N°\(turn)===============")
        }
    }
    
    func logicOfTheGame() {
        
        switch rollingDice() {
            
        case 1:
            print("It's Lazarus Action and he use Heal !")
            lazarus.heal()
            lazarus.restOfLife()
            elvin.restOfLife()
        case 2:
            print("Tt's Lazarus Action and he use the Weapon \(lazarusWeapon.name) VS Elvin")
            elvin.lifePoint -= lazarusWeapon.damage
            lazarus.restOfLife()
            elvin.restOfLife()
        case 3:
            print("It's Lazarus Action and he use the Power \(lazarusPower.name) VS Elvin")
            elvin.lifePoint -= lazarusPower.damage
            lazarus.lifePoint += lazarusPower.specialEffect
            lazarus.restOfLife()
            elvin.restOfLife()
        case 4:
            print("It's Elvin Action and he use Heal !")
            elvin.heal()
            lazarus.restOfLife()
            elvin.restOfLife()
        case 5:
            print("It's Elvin Action and he use his Power \(elvinPower.name) VS Lazarus")
            lazarus.lifePoint -= elvinPower.damage
            lazarus.lifePoint -= elvinPower.specialEffect
            lazarus.restOfLife()
            elvin.restOfLife()
        case 6:
            print("It's Elvin Action and he use his Weapon \(elvinWeapon.name) VS Lazarus")
            lazarus.lifePoint -= elvinWeapon.damage
            lazarus.restOfLife()
            elvin.restOfLife()
        default:
            print("Error")
        }
        theWinnerIs(hero1: lazarus, hero2: elvin)
        
    }
    
    func theWinnerIs(hero1: Hero, hero2: Hero) {
        
        if (hero1.lifePoint <= 0) {
            print("The Winner is : \(hero2.name) at turn \(turn)")
            winner = true
        }
        if (hero2.lifePoint <= 0) {
            print("The winner is : \(hero1.name) at turn \(turn)")
            winner = true
        }
    }
    
    func rollingDice() -> Int {
        var dice: Int
        dice = Int.random(in: 1...6)
        print("Dice = \(dice)")
        
        return dice
    }
    
    


}

