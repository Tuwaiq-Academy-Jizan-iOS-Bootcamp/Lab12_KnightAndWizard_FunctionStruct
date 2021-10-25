//
//  ViewController.swift
//  DoaaAlageel_lab12_ClassStruct
//
//  Created by Dua'a ageel on 17/03/1443 AH.
//

import UIKit

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
    
  func lifeRemain() {
     print("Lazarus Life Points: \(lifePoints)")
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
    func lifeRemain() {
             print("Evlin Life Points: \(lifePoints)")
    }
   }

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

class ViewController: UIViewController {
     var lazarus = Lazarus.init(name: "Lazarus", level: 10, characteristic: "Knight", lifePoints: 160, swordAttack: -10, megaFist: -30, heal: 10)
     var evlin = Evlin.init(name: "Evline", level: 10, characteristic: "Wizard", lifePoints: 140, stickOfTheWise: -15, fireBall: -20, heal: 10)
     var lazarusWeapon = Weapon.init(name: "Sword Attack", damage: -10, attackAction: "Lazarus uses his powerfull sword to his opponent -10 Damage")
     var evlinWeapon = Weapon.init(name: "Stick Of The Wise", damage: -15, attackAction: "Elvin uses his magical and strange stick to beat his opponent -15 Damage")
     var lazarusPower = Power.init(name: "Mega Fist", damage: -30, attackAction: "Lazarus uses his Fist to beat his opponent -30 Damage", specialEffect: 2)
     var evlinPower = Power.init(name: "Fire Ball", damage: -20, attackAction: "Elvin uses the powerful fire spell learned centuries ago -20 Damage", specialEffect: 10)
     var turnNumber = 0
     var pos = 0
    
    override func viewDidLoad() {
             super.viewDidLoad()
         }
    
    @IBAction func DiceRullbutton(_ sender: UIButton) {
        turnNumber += 1
                let randomEnconter =  Int.random(in: 1...6)
                print("* Turn Number //\(turnNumber)// *")
                print("Dice Number: \(randomEnconter)")
                if randomEnconter == 1 {
                print("\(lazarus.name) Turn")
                    lazarus.Heal()
                    lazarus.lifePoints += lazarus.heal
                    gameOver()
                    lazarus.lifeRemain()
                    evlin.lifeRemain()
                print("* End of the Turn //\(turnNumber)// *")
                }else if randomEnconter == 2 {
                print("\(lazarus.name) Turn")
                    lazarusWeapon.swordAvtion()
                    evlin.lifePoints += lazarusWeapon.damage
                    gameOver()
                    lazarus.lifeRemain()
                    evlin.lifeRemain()
                print("* End of the Turn //\(turnNumber)// *")
                }else if randomEnconter == 3 {
                print("\(lazarus.name) Turn")
                    lazarusPower.fistAction()
                    evlin.lifePoints += lazarusPower.damage
                    lazarus.lifePoints += lazarusPower.specialEffect
                    gameOver()
                    lazarus.lifeRemain()
                    evlin.lifeRemain()
                print("* End of the Turn //\(turnNumber)// *")
                }else if randomEnconter == 4 {
                print("\(evlin.name) Turn")
                    evlin.Heal()
                    evlin.lifePoints += evlin.heal
                    gameOver()
                    lazarus.lifeRemain()
                    evlin.lifeRemain()
                print("* End of the Turn //\(turnNumber)// *")
                }else if randomEnconter == 5 {
                    print("\(evlin.name) Turn")
                    evlinPower.fireBallAction()
                    lazarus.lifePoints -= evlinPower.damage
                    lazarus.lifePoints -= evlinPower.specialEffect
                    gameOver()
                    lazarus.lifeRemain()
                    evlin.lifeRemain()
                print("* End of the Turn //\(turnNumber)// *")
                }else {
                print("\(evlin.name) Turn")
                    evlinWeapon.stickAction()
                    lazarus.lifePoints += evlinWeapon.damage
                    gameOver()
                    lazarus.lifeRemain()
                    evlin.lifeRemain()
                print("* End of the Turn //\(turnNumber)// *")
                }
                if evlin.lifePoints <= pos {
                    print("*// THE WINNER IS.. //*")
                    print("*\(lazarus.name) is the WINNER !!!*")
                    print("END OF THE GAME")
                }else if lazarus.lifePoints <= pos {
                    print("*// THE WINNER IS.. //*")
                    print("* \(evlin.name) is the WINNER !!! *")
                    print("END OF THE GAME")
                }
            }
            func gameOver() {
                if lazarus.lifePoints < pos{
                    lazarus.lifePoints = 0
                }else if evlin.lifePoints < pos {
                    evlin.lifePoints = 0
                }
            }
      }
        
    
    


