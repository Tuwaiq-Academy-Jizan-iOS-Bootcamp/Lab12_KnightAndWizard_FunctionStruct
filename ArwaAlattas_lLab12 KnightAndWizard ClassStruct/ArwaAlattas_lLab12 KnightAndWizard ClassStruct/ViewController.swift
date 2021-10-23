//
//  ViewController.swift
//  ArwaAlattas_lLab12 KnightAndWizard ClassStruct
//
//  Created by Arwa Alattas on 16/03/1443 AH.
//

import UIKit

class Hero {
    var name : String
    var characteristic : String
    var level : Int
    var lifePoint : Int
    
    
    init(name:String,characteristic: String, level : Int,lifePoint : Int){
        self.name = name
        self.characteristic = characteristic
        self.level = level
        self.lifePoint = lifePoint
    }
    
}
                                  // Lazarus \\
class Lazarus : Hero {
   
    override init(name: String, characteristic: String, level: Int, lifePoint: Int) {
        super.init(name: name, characteristic: characteristic, level:level, lifePoint: lifePoint)
       
    }
}

                                   // ELVIN \\

class Elvin : Hero {
    override init( name: String, characteristic: String, level: Int, lifePoint: Int) {
        super.init(name: name, characteristic: characteristic, level:level, lifePoint: lifePoint)
        
    }
}
struct Weapon {

    var name :String
    var damage :Int
    var attackAction:String
}

struct Power {
    
    var name :String
    var damage :Int
    var attackAction:String
    var  specialEffect : Int
   
}


class ViewController: UIViewController {
   var turnNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    @IBAction func rollTheDice(_ sender: UIButton) {
        let lazarus = Lazarus.init(name: "Lazarus", characteristic: "Knight", level: 1, lifePoint: 160)
        let elvin = Elvin(name: "Elvin", characteristic: "Wizard ", level: 1, lifePoint: 140)
        let sword = Weapon.init(name: "Sword Attack", damage: 10, attackAction:"Sword Attack inficting -10 ")
        let mega = Power.init(name: "Mega Fist", damage: 30, attackAction: "Mega Fist inficting -30 ", specialEffect: 2)
        let stick = Weapon.init(name: "Stick of the wise", damage: 15, attackAction:"stick of the wise inficting -20 ")
        let fireBall = Power.init(name: "Fire Ball", damage: 20, attackAction: "fire ball inficting -15 ", specialEffect: 10)
        while lazarus.lifePoint > 0 && elvin.lifePoint > 0 {
             turnNumber += 1
            let rollofdice = Int.random(in: 1...6)
        if rollofdice == 1 {
            print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
            print("The Dice = \(rollofdice)")
            print("Lazaruse use a Heal that + 10 to hid life point")
            lazarus.lifePoint += 10
            print("life point for Lazaruse is \(lazarus.lifePoint)  ")
            print("life point for Elvin is \(elvin.lifePoint)")
            print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
        }
        else if rollofdice == 2 {
            print("The Dice = \(rollofdice)")
            print("\(lazarus.name)use \(sword.attackAction)damage to \(elvin.name) ")
            elvin.lifePoint -= sword.damage
           print("life point for Lazaruse is \(lazarus.lifePoint)  ")
           print("life point for Elvin is \(elvin.lifePoint)")
            print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
        }
       else if rollofdice == 3 {
           print("The Dice = \(rollofdice)")
           print("\(lazarus.name)use \(mega.attackAction)damage to \(elvin.name) and it is have special effect it add to lazarus 2 life point ")
           elvin.lifePoint -= mega.damage
           lazarus.lifePoint += mega.specialEffect
            print("life point for Lazaruse is \(lazarus.lifePoint) and  ")
            print("life point for Elvin is \(elvin.lifePoint)")
           print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
       }
        else if rollofdice == 4 {
            print("The Dice = \(rollofdice)")
            print("Elvine use a Heal that + 15 to hid life point")
            elvin.lifePoint += 15
            print("life point for Lazaruse is \(lazarus.lifePoint)  ")
            print("life point for Elvin is \(elvin.lifePoint)")
            print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
        }
        else if rollofdice == 5 {
            print("The Dice = \(rollofdice)")
            print("\(elvin.name)use \(fireBall.attackAction)damage to \(lazarus.name) and it is have special effect it subtract 10 life point for lazarus")
            lazarus.lifePoint -= fireBall.damage
            lazarus.lifePoint -= fireBall.specialEffect
            print( "life point for Lazaruse is \(lazarus.lifePoint)  ")
           print("life point for Elvin is \(elvin.lifePoint)")
            print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
        }
       else if rollofdice == 6 {
           print("The Dice = \(rollofdice)")
           print("\(elvin.name)use \(stick.attackAction)damage to \(lazarus.name) ")
           lazarus.lifePoint -= stick.damage
            print( "life point for Lazaruse is \(lazarus.lifePoint)  ")
            print("life point for Elvin is \(elvin.lifePoint)")
           print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
       }
        }
        
        if lazarus.lifePoint <= 0 {
           print("🥳🥳the winner is Elvin 🥳🥳")
        }else if elvin.lifePoint <= 0  {
            print("🥳🥳the winner is Lazarus🥳🥳")
        }
        }
        }
        
    
