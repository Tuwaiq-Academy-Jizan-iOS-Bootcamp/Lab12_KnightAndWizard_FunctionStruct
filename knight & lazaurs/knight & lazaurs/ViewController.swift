//
//  ViewController.swift
//  knight & lazaurs
//
//  Created by Yasir Hakami on 24/10/2021.
//

import UIKit

class ViewController: UIViewController {
    var lazarus = Lazarus.init(name: "Lazarus", level: 10, characteristic: "Knight", lifePoints: 160, swordAttack: -10, megaFist: -30, heal: 10)
    var evlin = Evlin.init(name: "Evline", level: 10, characteristic: "Wizard", lifePoints: 140, stickOfTheWise: -15, fireBall: -20, heal: 10)
    var lazarusWeapon = Weapon.init(name: "Sword Attack", damage: -10, attackAction: "Lazarus uses his powerfull sword to his opponent -10 Damage")
    var evlinWeapon = Weapon.init(name: "Stick Of The Wise", damage: -15, attackAction: "Elvin uses his magical and strange stick to beat his opponent -15 Damage")
    var lazarusPower = Power.init(name: "Mega Fist", damage: -30, attackAction: "Lazarus uses his Fist to beat his opponent -30 Damage", specialEffect: 2)
    var evlinPower = Power.init(name: "Fire Ball", damage: -20, attackAction: "Elvin uses the powerful fire spell learned centuries ago -20 Damage", specialEffect: 10)
    var dead = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print("END OF THE GAME")
        
        
    }
    
              
    @IBOutlet weak var rollDice: UIButton!
    for in lazarus.lifePoints > dead && evlin.lifePoints > dead {
        let randomEnconter =  Int.random(in: 1...6)
        if randomEnconter == 1 {
            print("The Dice Rull is \(randomEnconter)")
            lazarus.Heal()
            lazarus.lifePoints += lazarus.heal
            print("Lazarus have \(lazarus.lifePoints) Life Points")
        }else if randomEnconter == 2 {
            print("The Dice Rull is \(randomEnconter)")
            lazarusWeapon.swordAvtion()
            evlin.lifePoints += lazarusWeapon.damage
            print("Elvin have \(evlin.lifePoints) Life Points remain")
        }else if randomEnconter == 3 {
            print("The Dice Rull is \(randomEnconter)")
            lazarusPower.fistAction()
            evlin.lifePoints += lazarusPower.damage
            lazarus.lifePoints += lazarusPower.specialEffect
            print("Elvin have \(evlin.lifePoints) Life Points remain")
            print("Lazarus have \(lazarus.lifePoints) Life Points")
        }else if randomEnconter == 4 {
            print("The Dice Rull is \(randomEnconter)")
            evlin.Heal()
            evlin.lifePoints += evlin.heal
            print("Elvin have \(evlin.lifePoints) Life Points")
        }else if randomEnconter == 5 {
            print("The Dice Rull is \(randomEnconter)")
            evlinPower.fireBallAction()
            lazarus.lifePoints -= 30
            print("Lazarus have \(lazarus.lifePoints) Life Points remain")
        }else {
            print("The Dice Rull is \(randomEnconter)")
            evlinWeapon.stickAction()
            lazarus.lifePoints += evlinWeapon.damage
            print("Lazarus have \(lazarus.lifePoints) Life Points remain")
        }
        if evlin.lifePoints <= dead {
            print("\(lazarus.name) is a WINNER !!!")
        }else if lazarus.lifePoints <= dead {
            print("\(evlin.name) is a WINNER !!!")
        }
    
    
    }
    
}
    class Hero{
    var name:String
    var Level:Int
    var characteristic:String
    var lifePoints:Int
    init (name:String,level:Int,characteristic:String,lifePoints:Int){
        self.name = name
        self.Level = level
        self.characteristic = characteristic
        self.lifePoints = lifePoints
    }
}
class Lazarus: Hero{
    var swordAttack:Int
    var megaFist:Int
    var heal:Int
    init(name: String, level: Int, characteristic: String, lifePoints: Int, swordAttack:Int, megaFist:Int,heal:Int) {
        self.swordAttack = swordAttack
        self.megaFist = megaFist
        self.heal = heal
        super .init(name: name, level: level, characteristic: characteristic, lifePoints: lifePoints)
    }
    func Heal() {
        print("Lazarus use his healing skill and Recover +10 Life Points")
    }
}
             
class Evlin: Hero{
    var stickOfTheWise:Int
    var fireBall:Int
    var heal:Int
    init(name: String, level: Int, characteristic: String, lifePoints: Int, stickOfTheWise:Int, fireBall:Int,heal:Int) {
        self.stickOfTheWise = stickOfTheWise
        self.fireBall = fireBall
        self.heal = heal
        super.init(name: name, level: level, characteristic: characteristic, lifePoints: lifePoints)
    }
    func Heal() {
        print("Evlin use his healing skill and Recover +15 Life Points")
    }
}
             
struct Weapon{
    var name:String
    var damage:Int
    var attackAction:String
    func swordAvtion(){
        print("Lazarus uses his powerfull sword to his opponent -10 Damage")
    }
    func stickAction(){
        print("Elvin uses his magical and strange stick to beat his opponent -15 Damage")
    }
}

struct Power{
    var name:String
    var damage:Int
    var attackAction:String
    var specialEffect:Int
    func fistAction() {
        print("Lazarus uses his Fist to beat his opponent -30 Damage and get +2 Life Points")
    }
    func fireBallAction(){
        print("Elvin uses the powerful fire spell learned centuries ago -20 Damage and empower his attack by 10")
    }
}
               


