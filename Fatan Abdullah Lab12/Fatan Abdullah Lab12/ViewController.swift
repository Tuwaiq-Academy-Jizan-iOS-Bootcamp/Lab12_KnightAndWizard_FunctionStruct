
import UIKit

class Hero{
var name:String
var characteristic:String
var lifePoints:Int
var Level:Int
init (name:String,characteristic:String,lifePoints:Int,level:Int){
        
    self.name = name
    self.characteristic = characteristic
    self.lifePoints = lifePoints
    self.Level = level
}
}
class Lazarus: Hero{
var swordAttack:Int
var  megaFist:Int
var heal:Int
    init(name:String,characteristic:String,lifePoints:Int,level:Int,megaFist:Int,heal:Int,swordAttack:Int){
self.swordAttack = swordAttack
self.megaFist = megaFist
self.heal = heal
super.init(name: name, characteristic: characteristic, lifePoints: lifePoints, level: level)
    }
    func Heal (){
        print("Lazarus use his healing skill and Recover +10 Life points")
    }
}
class Elvin: Hero{
var stickOfTheWise:Int
var fireBall:Int
var heal:Int
    init(name:String,characteristic:String,lifePoints:Int,level:Int,stickOfTheWise:Int,fireBall:Int,heal:Int){
        self.stickOfTheWise = stickOfTheWise
        self.fireBall = fireBall
        self.heal = heal
        super.init(name: name, characteristic: characteristic, lifePoints: lifePoints, level: level)
    }
    func Heal(){
        print("Elvin use his healing skill and Recover +15 Life points")
    }
    }
struct Weapon{
var name:String
var damage:Int
var attackAction:String
    
    
func sordAvtion(){
        print("Lazarus uses his powerfull sword to his opponent -10 Damage")
}
func stickAction(){
        print("Elvin uses his magical and strange stick to beat his opponent -15 Damage")
    }
}
struct power{
var name:String
var damage:Int
var attackAction:String
var specialEffect:Int
    
func fistAction(){
print("Lazarus uses his Fist to beat his opponent -30 Damage and get +2 Life points")
    }
func fireBallAction(){
    
print("Elvin uses the powerful fire spell learned centuries ago -20 Damage and empower his attack by 10")
}
}
class ViewController: UIViewController {
    
    
    var lazarus = Lazarus.init(name: "Lazarus", characteristic: "Knight", lifePoints: 160, level: 5, megaFist: 30, heal: 10, swordAttack: 10)
    var elvin = Elvin.init(name: "Elvin", characteristic: "wizard", lifePoints: 140, level: 5, stickOfTheWise: 15, fireBall: 20, heal: 15)
    
    var lazarusWeapon = Weapon.init(name: "swordAttack", damage: 10, attackAction: "Lazarus uses his powerfull sword to his opponent - 10 Damage")
    var elvinWeapon = Weapon.init(name: "StickOfTheWise", damage: -15, attackAction: "Elvin uses his magical and strange stick to beat his opponent  15 Damage")
    
    var lazarusPower = power.init(name: "MegaFist", damage: 30, attackAction: "Lazarus uses his Fist to beat his opponent  30 Damage)", specialEffect: 2)
    var elvinPower = power.init(name: "FireBall", damage: 20, attackAction: "Elvin uses the powerful fire spell learned centuries ago  20 Damage", specialEffect: 10)
    var got = 0

override func viewDidLoad() {
super.viewDidLoad()
}
    @IBAction func rollDice(_ sender: Any) {
    
    if lazarus.lifePoints == got || elvin.lifePoints == got{ print("End of the Game")}
    if lazarus.lifePoints > got || elvin.lifePoints > got {
                let rollDice =  Int.random(in: 1...6)
                if rollDice == 1 {
                    lazarus.Heal()
                    lazarus.lifePoints += lazarus.heal
                print("Lazaru life point = \(lazarus.lifePoints)")
                print("elvin life point = \(elvin.lifePoints)")
                print("**************************************")
                    
                }else if rollDice == 2 {
                print("the dice rool is \(rollDice)")
                lazarusWeapon.sordAvtion()
                elvin.lifePoints -= lazarusWeapon.damage
                print("Lazaru life point = \(lazarus.lifePoints)")
                    print("elvin life point = \(elvin.lifePoints)")
                    print("**************************************")
                }else if rollDice == 3 {
                    print("the dice rool is \(rollDice)")
                    lazarusPower.fistAction()
                    elvin.lifePoints -= lazarusWeapon.damage
                    lazarus.lifePoints += lazarusPower.specialEffect
                    print("Lazaru life point = \(lazarus.lifePoints)")
                    print("elvin life point = \(elvin.lifePoints)")
                    print("**************************************")
                }else if rollDice == 4 {
                    print("the dice rool is \(rollDice)")
                    elvin.Heal()
                    elvin.lifePoints += elvin.heal
                    print("Lazaru life point = \(lazarus.lifePoints)")
                    print("elvin life point = \(elvin.lifePoints)")
                    print("**************************************")
                }else if rollDice == 5 {
                    print("the dice rool is \(rollDice)")
                    elvinPower.fireBallAction()
                    lazarus.lifePoints -= elvinPower.damage
                    elvin.lifePoints -= elvinPower.specialEffect
                    print("Lazaru life point = \(lazarus.lifePoints)")
                    print("elvin life point = \(elvin.lifePoints)")
                    print("**************************************")
                    
                }else {
                    print("the dice rool is \(rollDice)")
                    elvinWeapon.stickAction()
                    lazarus.lifePoints -= elvinWeapon.damage
                    print("Lazaru life point = \(lazarus.lifePoints)")
                    print("elvin life point = \(elvin.lifePoints)")
                    print("**************************************")
                }
                if elvin.lifePoints <= got {
                    print("\(lazarus.name) is a WINNER 🥳🥳")
                } else if lazarus.lifePoints <= got {
                    print("\(elvin.name) is a WINNER 🥳🥳")
                }
            }
    } }
