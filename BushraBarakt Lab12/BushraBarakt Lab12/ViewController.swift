//
//  ViewController.swift
//  BushraBarakt Lab12
//
//  Created by Bushra Barakat on 16/03/1443 AH.
//

import UIKit
class Hero {
    var name : String
    var characteristic: String
    var level : Int
    var lifePoint : Int
   
    
    init (name: String,characteristic: String, level: Int, lifePoint: Int ){
        self.name = name
        self.characteristic = characteristic
        self.level = level
        self.lifePoint = lifePoint
        
    
    }
    }

class HeroLazarus: Hero  {
    var heal: Int
    var swordAttack: Int
    var megaFist: Int
    
    init(name: String, characteristic: String, level: Int, lifePoint: Int, heal: Int, swordAttack: Int, megaFist: Int) {
        self.heal = heal
        self.swordAttack = swordAttack
        self.megaFist = megaFist
        super.init(name: name, characteristic: characteristic, level: level, lifePoint: lifePoint)
    }
    func healLazarus(){
        print ("Lazarus recovered 10 life poin")
}
    func restOfLife() {
        if lifePoint < 0 {
            lifePoint = 0
        }
        print("Rest of life point for Lazarus : \(lifePoint)")
    }
}

class HeroElvin: Hero {
    var heal: Int
    var stickOfTheWise: Int
    var fireBall: Int
    
    init(name: String, characteristic: String, level: Int, lifePoint: Int, heal: Int, stickOfTheWise: Int, fireBall: Int) {
        self.heal = heal
        self.stickOfTheWise = stickOfTheWise
        self.fireBall = fireBall
        super.init(name: name, characteristic: characteristic, level: level, lifePoint: lifePoint)
    }
    func healElvin(){
        print ("Elvin recovered 15 life point")
        
}
    func restOfLife() {
        if lifePoint < 0 {
            lifePoint = 0
        }
        print("Rest of life point for Lazarus : \(lifePoint)")
    }
}

struct Weapon {
    var name: String
    var damage: Int
    var attackAction: String
    func swordAction(){
    print ("Lazarus uses his powerfull sword to his opponent - 10 Damage")
        }
    func stickAction(){
    print ("Elvin uses his magical and strange stick to beat his opponent - 15 Damage ")
        
}
}

struct Power {
    var name: String
    var damage: Int
    var attackAction: String
    var specialEffect: Int
    func megaFist(){
    print("Lazarus uses his Fist to beat his opponent - 30 Damage and git +2 Life Point")
    }
    func fireBall(){
    print ("Elvin uses the powerful fire spell learned centuries ago - 20 Damage and empower his his by 10")
}
}

class ViewController: UIViewController {

    var lazarus = HeroLazarus.init(name: "Lazarus", characteristic: "knight", level: 10, lifePoint: 160, heal: 10, swordAttack: 10, megaFist: 30)
    
    var elvin = HeroElvin.init(name: "Elvin", characteristic: "wizard", level: 10, lifePoint: 140, heal: 10, stickOfTheWise: 15, fireBall: 20)
    
    
    var lazarusWeapon = Weapon.init(name: "sword attack", damage: 10, attackAction: "Lazarus uses his powerfull sword to his opponent - 10 Damage")
    
    var elvinWeapon = Weapon.init(name: "stick of the wise", damage: 15, attackAction: "Elvin uses his magical and strange stick to beat his opponent - 15 Damage ")
    
    
    var lazarusPower = Power.init(name: "mega fist", damage: 30, attackAction: "Lazarus uses his Fist to beat his opponent - 30 Damage and git +2 Life Point", specialEffect: 2)
    
    var elvinPower = Power.init(name: "fire ball", damage: 20, attackAction: "Elvin uses the powerful fire spell learned centuries ago - 20 Damage and empower his his by 10", specialEffect: 10)
    
    var dead = 0
    
    @IBOutlet weak var heroImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
}
   var winner = false
   var turn = 0
    

    @IBAction func button(_ sender: Any) {
        turn += 1
        if winner {
            print("Game Over ! ")
        } else {
            print("------- This is the turn N°\(turn)--------")
            logicOfTheGame()
            print("============== This is the end of turn N°\(turn)===============")
        }
    }
    func logicOfTheGame(){
        if lazarus.lifePoint == dead || elvin.lifePoint == dead { print ("end of the game")}
        
        if  lazarus.lifePoint > dead || elvin.lifePoint > dead {
            let randomDice = Int.random(in:1...6)
            if randomDice == 1 {
                print ("the dice roll is \(randomDice)")
                lazarus.healLazarus()
                lazarus.lifePoint += lazarus.heal
                lazarus.restOfLife()
                elvin.restOfLife()
                print ("...................................")
            }else if randomDice == 2 {
                print ("the dice roll is \(randomDice)")
                lazarusWeapon.swordAction()
                elvin.lifePoint -= lazarusWeapon.damage
                lazarus.restOfLife()
                elvin.restOfLife()
                print ("...................................")
            }else if randomDice == 3 {
                print ("the dice roll is \(randomDice)")
                lazarusPower.megaFist()
                elvin.lifePoint -= lazarusPower.damage
                lazarus.lifePoint += lazarusPower.specialEffect
                lazarus.restOfLife()
                elvin.restOfLife()
                print(".....................................")
            }else if randomDice == 4 {
                print ("the dice roll is \(randomDice)")
                elvin.healElvin()
                elvin.lifePoint += elvin.heal
                lazarus.restOfLife()
                elvin.restOfLife()
                print ("....................................")
            }else if randomDice == 5 {
                print ("the dice roll is \(randomDice)")
                elvinPower.fireBall()
                lazarus.lifePoint -= elvinPower.damage
                lazarus.lifePoint -= elvinPower.specialEffect
                lazarus.restOfLife()
                elvin.restOfLife()
                print (".....................................")
            }else {
                print ("the dice roll is \(randomDice)")
                elvinWeapon.stickAction()
                lazarus.lifePoint -= elvinWeapon.damage
                lazarus.restOfLife()
                elvin.restOfLife()
                print ("......................................")
            }
            if elvin.lifePoint <= dead {
                print ("\(lazarus.name) is a WINNER 🥳")
                heroImage.image = UIImage (named:  "Lazarus")
                winner = true
                
            }else if lazarus.lifePoint <= dead {
                print ("\(elvin.name) is a WINNER 🥳")
                heroImage.image = UIImage (named: "Elvin")
                winner = true
                print ("......................................")
            }
        }
   
    }
    }
