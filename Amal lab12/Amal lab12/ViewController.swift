//
//  ViewController.swift
//  Amal lab12
//
//  Created by Amal Jeli on 17/03/1443 AH.
//

import UIKit
class Hero {
    var name :String
    var level :Int
    var pointLife :Int
    var weapon :String
    var power :String
    var heal :Int
    init (name:String ,level:Int, pointLife:Int ,weapon:String , power:String , heal: Int){
        self.name = name
        self.level = level
        self.pointLife = pointLife
        self.weapon = weapon
        self.power = power
        self.heal = heal
    }
}
//}
//        //class Lazarus: Hero{
//          //  var swordAttack:Int
//         //   var megaFist:Int
//            var heal:Int
//            init(name: String, level: Int, characteristic: String, lifePoints: Int, swordAttack:Int, megaFist:Int,heal:Int) {
//                self.swordAttack = swordAttack
//                self.megaFist = megaFist
//                self.heal = heal
//                super.init( name: name, charcteristic: characteristic, level: level, pointLife: pointLife)
//            }
//
//            func Heal() {
//                print("Lazarus use his healing skill and Recover +10 Life Points")
//            }
//        }
//
//        class Evlin: Hero{
//            var stickOfTheWise:Int
//            var fireBall:Int
//            var heal:Int
//            init(name: String, level: Int, characteristic: String, lifePoints: Int, stickOfTheWise:Int, fireBall:Int,heal:Int) {
//                self.stickOfTheWise = stickOfTheWise
//                self.fireBall = fireBall
//                self.heal = heal
//                super.init(name: name, charcteristic: characteristic, level: level, pointLife: pointLife)
//            }
//            func Heal() {
//                print("Evlin use his healing skill and Recover +15 Life Points")
//            }
//        }
//
//
    struct Weapon {
        var name :String
        var damage:Int
        var attackAction:String
        func swordAvtion(){
            print("Lazarus uses his powerfull sword to his opponent -10 Damage")
        }
        func stickAction(){
            print("Elvin uses his magical and strange stick to beat his opponent -15 Damage")
        }
    }
        
        
        struct Power {
            var nameWeapon :String
            var damageWeapon :Int
            var attackAction:String
           var SpecialEffectEffect :Int
            func fistAction(){
                
                print("Lazarus uses his Fist to beat his opponent -30 Damage and get +2 Life Points")
            }
            func fireBallAction(){
                print("Elvin uses the powerful fire spell learned centuries ago -20 Damage and empower his attack by 10")
            }
        }
           
        
        
class ViewController: UIViewController {
    
    
    var lazarus = Hero.init(name: "lazarus", level: 10, pointLife: 160, weapon:"sowrd", power:"megaFist", heal: 10)
    
    
    var evlin = Hero.init(name: "Evline", level: 10, pointLife: 140 ,weapon:"fiarBall" , power: "sticOfTheWaise", heal:15 )
    
    var lazarusWeapon = Weapon.init(name: "Sword Attack", damage: 10, attackAction: "Lazarus uses his powerfull sword to his opponent 10 Damage")
    
   var evlinWeapon = Weapon.init(name: "Stick Of The Wise", damage: 15, attackAction: "Elvin uses his magical and strange stick to beat his opponent 15 Damage")
    
    var lazarusPower = Power.init(nameWeapon: "Mega Fist", damageWeapon: 30, attackAction: "Lazarus uses his Fist to beat his opponent -30 Damage", SpecialEffectEffect: 2)
    
    var evlinPower = Power.init(nameWeapon: "Fire Ball", damageWeapon: 20, attackAction: "Elvin uses the powerful fire spell learned centuries ago -20 Damage", SpecialEffectEffect: 10)
var dead = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()}
    
      
    @IBAction func RollDice(_ sender: Any) {
    
        if lazarus.pointLife > dead && evlin.pointLife > dead {
            let randomEnconter =  Int.random(in: 1...6)
            if randomEnconter == 1 {
                print("The Dice Rull is \(randomEnconter)")
                lazarus.pointLife += lazarus.heal
                print("Lazarus have \(lazarus.pointLife) Life Points")
            }else if randomEnconter == 2 {
                print("The Dice Rull is \(randomEnconter)")
                lazarusWeapon.swordAvtion()
                evlin.pointLife += lazarusWeapon.damage
                print("Elvin have \(evlin.pointLife) pointLife remain")
            }else if randomEnconter == 3 {
                print("The Dice Rull is \(randomEnconter)")
                lazarusPower.fistAction()
                evlin.pointLife += lazarusPower.damageWeapon
                lazarus.pointLife += lazarusPower.SpecialEffectEffect
                print("Elvin have \(evlin.pointLife) pointLife remain")
                print("Lazarus have \(lazarus.pointLife) Life Points")
            }else if randomEnconter == 4 {
                print("The Dice Rull is \(randomEnconter)")
                evlin.pointLife += evlin.heal
                print("Elvin have \(evlin.pointLife) Life Points")
            }else if randomEnconter == 5 {
                print("The Dice Rull is \(randomEnconter)")
                evlinPower.fireBallAction()
                lazarus.pointLife -= 30
                print("Lazarus have \(lazarus.pointLife) Life Points remain")
            }else if randomEnconter == 6 {
                print("The Dice Rull is \(randomEnconter)")
                evlinPower.fireBallAction()
                lazarus.pointLife -= 20
                evlin.pointLife += 10
                print("Lazarus have \(lazarus.pointLife) Life Points remain")

//            }else {
//                print("The Dice Rull is \(randomEnconter)")
//                evlinWeapon.stickAction()
//                lazarus.pointLife += evlinWeapon.damage
//                print("Lazarus have \(lazarus.pointLife) Life Points remain")
            }
            if evlin.pointLife <= dead {
                print("\(lazarus.name) is a WINNER !!!")
                print("END OF THE GAME")
                
            }else if lazarus.pointLife <= dead {
                print("\(evlin.name) is a WINNER !!!")
                print("END OF THE GAME")
            }
            
        }
        
        

    }
}
