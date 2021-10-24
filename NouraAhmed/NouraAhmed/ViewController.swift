//
//  ViewController.swift
//  NouraAhmed
//
//  Created by NoON .. on 18/03/1443 AH.
//

import UIKit
//class Mother//
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
//sup class 1//
class Lazarus: Hero {
    var heal: Int
    var swordAttack: Int
    var megaFist: Int
    init(name:String, level:Int, characteristic:String, lifePoints:Int,heal:Int ,swordAttack:Int, megaFist:Int) {
        self.heal = heal
        self.swordAttack = swordAttack
        self.megaFist = megaFist
        super.init(name: name, level: level, characteristic: characteristic, lifePoints: lifePoints)
}
    func Heal() {
        print("Lazarus use his healing skill and Recover +10 Life Points")
    }
}

// sup class 2 //

class Elvin: Hero {
    var heal: Int
    var fireBall: Int
    var stickOfTheWise: Int
    init(name: String, level: Int, characteristic: String, lifePoints: Int,heal:Int, fireBall:Int ,stickOfTheWise:Int) {
        self.heal = heal
        self.fireBall = fireBall
        self.stickOfTheWise = stickOfTheWise
        
        super.init(name: name, level: level, characteristic: characteristic, lifePoints: lifePoints)
}
    func Heal() {
        print("Evlin use his healing skill and Recover +15 Life Points")
    }
}

//struct 1 //
    struct Weapon{
        var name: String
        var damage: Int
        var attackAction:String
        func swordAvtion(){
            
            print("Lazarus uses his powerfull sword to his opponent -10 Damage")
                }
                func stickAction(){
                    print("Elvin uses his magical and strange stick to beat his opponent -15 Damage")
                }
            }
//struct 2 //
        struct Power{
            var name: String
            var damage: Int
            var attackAction:String
            var specialEffect: Int
        
            func fistAction(){
                print("Lazarus uses his Fist to beat his opponent -30 Damage and get +2 Life Points")
            }
            func fireBallAction() {

                print("Elvin uses the powerful fire spell learned centuries ago -20 Damage and empower his attack by 10")
            }
        }
        // veriables \\

class ViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    var lazarus = Lazarus.init(name: "Lazarus", level:5 , characteristic: "knight", lifePoints: 160, heal: 10, swordAttack: 10, megaFist: 30)
    var elvin = Elvin.init(name: "Elvin", level: 5, characteristic: "wizard", lifePoints: 140, heal: 15, fireBall: 20, stickOfTheWise: 15)
    
    var lazarusWeapon = Weapon.init(name: "swordAttack", damage: 10, attackAction: "Lazarus uses his powerfull sword to his opponent - 10 Damage")
    var elvinWeapon = Weapon.init(name: "stickOfTheWise", damage: 15, attackAction: "Elvin uses his magical and strange stick to beat his opponent - 15 Damage")
    
    var lazarusPower = Power.init(name: "megaFist", damage: 30, attackAction: "Lazarus uses his Fist to beat his opponent - 30 Damage", specialEffect: 2)
    var elvinPower = Power.init(name: "fireBall", damage: 20, attackAction: "Elvin uses the powerful fire spell learned centuries ago - 20 Damage", specialEffect: 10)

    var got = 0
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func rollDice(_ sender: Any) {
    if lazarus.lifePoints == got || elvin.lifePoints == got {print("End Of The Game")}
        
        if lazarus.lifePoints > got || elvin.lifePoints > got {
                     let rollDice =  Int.random(in: 1...6)
                     if rollDice == 1 {
                         lazarus.Heal()
                         lazarus.lifePoints += lazarus.heal
                         print("Lazarus life point = \(lazarus.lifePoints)")
                         print("elvin life point = \(elvin.lifePoints)")
                         print("***************************************")
                         
                     }else if rollDice == 2 {
                         print("the dice rool is \(rollDice)")
                         lazarusWeapon.swordAvtion()
                         elvin.lifePoints -= lazarusWeapon.damage
                         print("Lazarus life point = \(lazarus.lifePoints)")
                         print("elvin life point = \(elvin.lifePoints)")
                         print("***************************************")
                         
                     }else if rollDice == 3 {
                         print("the dice rool is \(rollDice)")
                         lazarusPower.fistAction()
                         elvin.lifePoints -= lazarusWeapon.damage
                         lazarus.lifePoints += lazarusPower.specialEffect
                         print("Lazarus life point = \(lazarus.lifePoints)")
                         print("elvin life point = \(elvin.lifePoints)")
                         print("***************************************")
                     }else if rollDice == 4 {
                         print("the dice rool is \(rollDice)")
                                      elvin.Heal()
                                      elvin.lifePoints += elvin.heal
                         print("Lazarus life point = \(lazarus.lifePoints)")
                         print("elvin life point = \(elvin.lifePoints)")
                         print("***************************************")
                                  }else if rollDice == 5 {
                                      print("the dice rool is \(rollDice)")
                                      elvinPower.fireBallAction()
                                      lazarus.lifePoints -= elvinPower.damage
                                      elvin.lifePoints += elvinPower.specialEffect
                                      print("Lazarus life point = \(lazarus.lifePoints)")
                                      print("elvin life point = \(elvin.lifePoints)")
                                      print("***************************************")
                                  }else {
                                      print("the dice rool is \(rollDice)")
                                      elvinWeapon.stickAction()
                                      lazarus.lifePoints -= elvinWeapon.damage
                                      print("Lazarus life point = \(lazarus.lifePoints)")
                                      print("elvin life point = \(elvin.lifePoints)")
                                      print("***************************************")
                                  }
                                  if elvin.lifePoints <= got {
                                      print("\(lazarus.name) is a WINNER ⚔️ ⚔️ ⚔️")
                                      image.image = UIImage (named: "lazarus")
                                      
                                  }else if lazarus.lifePoints <= got {
                                      print("\(elvin.name) is a WINNER 🔥 🔥 🔥")
                                      image.image = UIImage (named: "elvin")
                                      
                                  }
        
}
    }
}
