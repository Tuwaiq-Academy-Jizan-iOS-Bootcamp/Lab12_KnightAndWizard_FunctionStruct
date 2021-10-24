

import UIKit

class Hero {
    var name: String
    var level: Int
    var lifePoint: Int
    
    //The heal//
    
    struct Heal {
        var healingAmount: Int
    }
                                  //Struct The Weapon//
    struct Weapon{
        var nameOfAttack: String
        var damageOfAttack: Int
        func attackAction() {
            print("Lazarus uses his powerfull sword to his opponent - 10 Damage")
        }
                                //Struct The Power//
    }
    struct Power {
        var name: String
        var damage: Int
        var specialEffect: Int
        func attackAcation(){
            print("use Power : \(name) damage: \(damage)")
        }
        func SpecialEffectAction() {

            print("Get : \(specialEffect) Life Point")
        }
    }
    
    init(_ name: String, level: Int, lifePoint: Int) {
        self.name                    = name
        self.level                   = level
        self.lifePoint          = lifePoint
    }
}

                            //Lazarus skills //

class Lazarus: Hero {
    var heal = Heal(healingAmount: 10)
    var weapon = Weapon(nameOfAttack: "Sword Attack", damageOfAttack: 10)
    var power = Power(name: "Mega Fist", damage: 30, specialEffect: 2)
}


                           //Elvin skills//

class Elvin: Hero {
    var heal = Heal(healingAmount: 15)
    var weapon = Weapon(nameOfAttack: "Stick of the wise", damageOfAttack: 15)
    var power = Power(name: "Fire Ball", damage: 20, specialEffect: 10)
}
//___________________________//
//Lazarus got 3 special skills - Life point : 160//
//Elvin got 3 special skills - Life point 140//

class ViewController: UIViewController {
    var liz = Lazarus("Lazarus", level: 0, lifePoint: 160)
    
    var el  = Elvin("Elvin", level: 0, lifePoint: 140)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var rest: UIButton!
    
    @IBAction func dicrull(_ sender: Any) {
            let number = Int.random(in: 1...6)
            if number <= 3 {
                print(liz.name + " turn!")

                liz.lifePoint = liz.lifePoint + liz.heal.healingAmount

                print("he heals himself... his health now equals: \(liz.lifePoint)")

                el.lifePoint -= liz.weapon.damageOfAttack

                print("lizarus uses his \(liz.weapon.nameOfAttack)")
                print("elvis health now \(el.lifePoint)")

                el.lifePoint -= liz.power.damage
                liz.lifePoint = liz.lifePoint + liz.power.specialEffect
                print("lizarus uses his \(liz.power.name)")
                print("elvis health now \(el.lifePoint)")
            }else{
                print(el.name + " turn!")
                
                el.lifePoint = el.lifePoint + el.heal.healingAmount
                
                print("he heals himself... his health now equals: \(el.lifePoint)")
                
                liz.lifePoint -= el.weapon.damageOfAttack
                
                print("elvin uses his \(el.weapon.nameOfAttack)")
                print("lizarus health now \(liz.lifePoint)")
                
                liz.lifePoint -= el.power.damage + el.power.specialEffect
                
                print("elvin uses his \(el.power.name)")
                print("lizarus health now \(liz.lifePoint)")
            }
            
            
            if liz.lifePoint <= 0 {
                rest.isEnabled = false
                print("elvin won")
            }else if el.lifePoint <= 0 {
                rest.isEnabled = false
                print("lizarus won")
            }
    }
}
