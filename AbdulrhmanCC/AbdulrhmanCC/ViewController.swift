//
//  ViewController.swift
//  AbdulrhmanCC
//
//  Created by Abdulrhman Abuhyyh on 18/03/1443 AH.
//

import UIKit

struct Weapon {
    var name : String
    var damage : Int
    
    func attackWithWeapon() {
        print("The Hero use \(name) weapon and inflict \(damage)")
    }
}
struct Power {
    var name : String
    var damage : Int
    var specialEffect : Int
    
    func attackWithWeapon() {
        print("The Hero use \(name) power and inflict \(damage)")
    }
}


class Hero {
    var name : String
    var charact : String
    var leve : Int
    var lifePoint : Int
    var healPlus : Int
   
    init(name: String, charact : String, level: Int, lifePoint:Int, healPlus : Int) {
        self.name = name
        self.charact = charact
        self.leve = level
        self.lifePoint = lifePoint
        self.healPlus = healPlus
        
    }
    func heal(){
        lifePoint += healPlus
        print("the hero \(name) and the heald \(healPlus) point of life")
        
    }
}
class Knoigth : Hero {

    func restOfLife() {
        if lifePoint <= 0 {
            lifePoint = 0
        }
            print("Rest of life point for Lazarus : \(lifePoint)")
        
        
    }
}

class Wizard : Hero {
    func restOfLife() {
        if lifePoint <= 0 {
            lifePoint = 0
        }
            print("Rest of life point for elvin : \(lifePoint)")
    }
    
}

class ViewController: UIViewController {
    var turn: Int = 0
    var winner = false
    
        var lazarus = Knoigth(name: "Lazarous", charact: "Knoigth", level: 80, lifePoint: 160 , healPlus: 10)
    
    var elvin = Wizard(name: "Elvin", charact: "Wizard", level: 90, lifePoint: 140, healPlus: 15)
    
    var lazarusWeapon = Weapon(name: "Sowrd Attack", damage: 10)
    var lazarusPower = Power(name: "Mega Fist", damage: 30, specialEffect: 2)
    
    var elvinWeapon = Weapon(name: "Fire Ball", damage: 20)
    var elvinPower = Power(name: "Stick of the wise", damage: 15, specialEffect: 10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func rollingDice(_ sender: UIButton) {
        turn += 1
        if winner {
            print("Game Over ! ")
        } else {
            print("------- This is the turn N°\(turn)--------")
            theGame()
            print("============== This is the end of turn N°\(turn)===============")
        }
    }
    func theGame () {
        
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
        var dice : Int
        dice = Int.random(in: 1...6)
        print(dice)
        
        return dice
        
        
    }
            
        }

