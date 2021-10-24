//
//  ViewController.swift
//  ghaziSubayli_Lab12kinght
//
//  Created by ماك بوك on 18/03/1443 AH.
//


import UIKit
             
             //*Main Class*//
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
            
            //Knight Class//
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
            //Wizard Class//
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
           
            //Weapons Skills//
struct Weapon{
    var name:String
    var damage:Int
    var attackAction:String
    func swordAvtion(){
        print("Lazarus use his powerfull sword to do -10 Damage to his opponent")
    }
    func stickAction(){
        print("Elvin use his magical and strange stick to do -15 Damage to his opponent")
    }
}
             
             //Power Skills//
struct Power{
    var name:String
    var damage:Int
    var attackAction:String
    var specialEffect:Int
    func fistAction() {
        print("Lazarus use his Mighty Fist on his opponent and do -30 Damage and get +2 Life Points")
    }
    func fireBallAction(){
        print("Elvin empower his attack by 10 and use his powerful Fire Spell learned centuries ago to do -30 Damage to his opponent")
    }
}
              
              //Variables//

class ViewController: UIViewController {
    var lazarus = Lazarus.init(name: "Lazarus", level: 10, characteristic: "Knight", lifePoints: 160, swordAttack: -10, megaFist: -30, heal: 10)
    var evlin = Evlin.init(name: "Evline", level: 10, characteristic: "Wizard", lifePoints: 140, stickOfTheWise: -15, fireBall: -20, heal: 10)
    var lazarusWeapon = Weapon.init(name: "Sword Attack", damage: -10, attackAction: "Lazarus uses his powerfull sword to his opponent -10 Damage")
    var evlinWeapon = Weapon.init(name: "Stick Of The Wise", damage: -15, attackAction: "Elvin uses his magical and strange stick to beat his opponent -15 Damage")
    var lazarusPower = Power.init(name: "Mega Fist", damage: -30, attackAction: "Lazarus uses his Fist to beat his opponent -30 Damage", specialEffect: 2)
    var evlinPower = Power.init(name: "Fire Ball", damage: -20, attackAction: "Elvin uses the powerful fire spell learned centuries ago -20 Damage", specialEffect: 10)
    var turnNumber = 0
    var dead = 0
            
    
            //The Main Game//
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func buttonB(_ sender: Any) {
    turnNumber += 1
            let randomEnconter =  Int.random(in: 1...6)
            print("*=#####==* Turn Number //\(turnNumber)// *==####==*")
            if randomEnconter == 1 {
                print("The Dice Rull is: \(randomEnconter)")
                lazarus.Heal()
                lazarus.lifePoints += lazarus.heal
                print("\(lazarus.name) Life Points: \(lazarus.lifePoints)")
            }else if randomEnconter == 2 {
                print("The Dice Rull is: \(randomEnconter)")
                lazarusWeapon.swordAvtion()
                evlin.lifePoints += lazarusWeapon.damage
                print("\(evlin.name) Life Points: \(evlin.lifePoints)")
            }else if randomEnconter == 3 {
                print("The Dice Rull is: \(randomEnconter)")
                lazarusPower.fistAction()
                evlin.lifePoints += lazarusPower.damage
                lazarus.lifePoints += lazarusPower.specialEffect
                print("\(evlin.name) Life Points: \(evlin.lifePoints)")
                print("\(lazarus.name) Life Points: \(lazarus.lifePoints)")
            }else if randomEnconter == 4 {
                print("The Dice Rull is: \(randomEnconter)")
                evlin.Heal()
                evlin.lifePoints += evlin.heal
                print("\(evlin.name) Life Points: \(evlin.lifePoints)")
            }else if randomEnconter == 5 {
                print("The Dice Rull is: \(randomEnconter)")
                evlinPower.fireBallAction()
                lazarus.lifePoints -= 30
                print("\(lazarus.name) Life Points: \(lazarus.lifePoints)")
            }else {
                print("The Dice Rull is: \(randomEnconter)")
                evlinWeapon.stickAction()
                lazarus.lifePoints += evlinWeapon.damage
                print("\(lazarus.name) Life Points: \(lazarus.lifePoints)")
            }
            if evlin.lifePoints <= dead {
                print("*#**#**#***#*\\ THE WINNER IS.. //**#**#****#**")
                print("\(lazarus.name) is the WINNER !!!")
            }else if lazarus.lifePoints <= dead {
                print("**#****#***\\ THE WINNER IS.. //**#*#*****#*")
                print("Game Over")
                print("\(evlin.name) is the WINNER !!!")
                print("Game Over")
            }
        }
    }


