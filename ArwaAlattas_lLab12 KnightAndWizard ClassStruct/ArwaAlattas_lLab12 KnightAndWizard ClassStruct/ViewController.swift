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
   

}                               // Lazarus \\
class Lazarus : Hero {
    var heal = 10
    override init(name: String, characteristic: String, level: Int, lifePoint: Int) {
        super.init(name: name, characteristic: characteristic, level:level, lifePoint: lifePoint)
       
    }

}
                                   // ELVIN \\

class Elvin : Hero {
    var heal = 15
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
  
    @IBOutlet weak var rollthedise: UIButton!

    var turnNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    }
    let lazarus = Lazarus(name: "Lazarus", characteristic: "Knight", level: 1, lifePoint: 160)
    let elvin = Elvin(name: "Elvin", characteristic: "Wizard ", level: 1, lifePoint: 140)
    let sword = Weapon(name: "Sword Attack", damage: 10, attackAction:"Sword Attack inficting 10 ")
    let mega = Power(name: "Mega Fist", damage: 30, attackAction: "Mega Fist inficting 30 ", specialEffect: 2)
    let stick = Weapon(name: "Stick of the wise", damage: 15, attackAction:"stick of the wise inficting 15 ")
    let fireBall = Power(name: "Fire Ball", damage: 20, attackAction: "fire ball inficting 20 ", specialEffect: 10)
    
  
    @IBAction func rollTheDice(_ sender: UIButton) {
      
        
      if lazarus.lifePoint > 0 && elvin.lifePoint > 0 {
             turnNumber += 1
            let rollofdice = Int.random(in: 1...6)
           if rollofdice == 1 {
            
            print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
            print("The Dice = \(rollofdice)")
            print("Lazaruse use a Heal that + 10 to hid life point")
               lazarus.lifePoint += lazarus.heal
            print("life point for Lazaruse is \(lazarus.lifePoint)  ")
            print("life point for Elvin is \(elvin.lifePoint)")
              
           }else if rollofdice == 2{
            print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
            print("The Dice = \(rollofdice)")
            print("\(lazarus.name)use \(sword.attackAction)damage to \(elvin.name) ")
            elvin.lifePoint -= sword.damage
           print("life point for Lazaruse is \(lazarus.lifePoint)  ")
           print("life point for Elvin is \(elvin.lifePoint)")
               }
        else if rollofdice  == 3 {
           print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
           print("The Dice = \(rollofdice)")
           print("\(lazarus.name)use \(mega.attackAction)damage to \(elvin.name) and it is have special effect it add to lazarus 2 life point ")
           elvin.lifePoint -= mega.damage
           lazarus.lifePoint += mega.specialEffect
            print("life point for Lazaruse is \(lazarus.lifePoint) ")
            print("life point for Elvin is \(elvin.lifePoint)")
        }
        else if rollofdice == 4 {
            print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
            print("The Dice = \(rollofdice)")
            print("Elvine use a Heal that + 15 to hid life point")
               elvin.lifePoint += elvin.heal
            print("life point for Lazaruse is \(lazarus.lifePoint)  ")
            print("life point for Elvin is \(elvin.lifePoint)")
            
        }else if rollofdice == 5 {
            print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
            print("The Dice = \(rollofdice)")
            print("\(elvin.name)use \(fireBall.attackAction)damage to \(lazarus.name) and it is have special effect it subtract 10 life point for lazarus")
            lazarus.lifePoint -= fireBall.damage
            lazarus.lifePoint -= fireBall.specialEffect
            print( "life point for Lazaruse is \(lazarus.lifePoint)  ")
           print("life point for Elvin is \(elvin.lifePoint)")

        }else if rollofdice == 6{
           print ("-------------------------Turn Number \(turnNumber)-----------------------------------")
           print("The Dice = \(rollofdice)")
           print("\(elvin.name)use \(stick.attackAction)damage to \(lazarus.name) ")
           lazarus.lifePoint -= stick.damage
            print( "life point for Lazaruse is \(lazarus.lifePoint)  ")
            print("life point for Elvin is \(elvin.lifePoint)")
       }
        }
        
        if lazarus.lifePoint <= 0 {
            
           print("🥳🥳the winner is Elvin 🥳🥳")
            rollthedise.isEnabled = false
        }else if elvin.lifePoint <= 0  {
            print("🥳🥳the winner is Lazarus🥳🥳")
            rollthedise.isEnabled = false
        }}
       
}
        
        
     

    
