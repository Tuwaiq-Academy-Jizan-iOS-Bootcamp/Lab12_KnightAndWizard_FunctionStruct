

//

import UIKit
//CREATE THE STRUCT FOR EACH WEAPON & POWER

struct Weapon {
    var name: String
    var damage: Int
    func attackWithWeapon() {
        print("The Hero use \(name) weapon and inflict \(damage)")
    }
}
struct Power {
    var name: String
    var damage: Int
    var specialEffect: Int
    func attackWithPower(){
        print("The Hero USE \(name) power and inflict \(damage)")
    }
}
//CREATE 3 CLASSES ONE IS PARENT AND 2 SUBCLASS
class Hero {
    var name: String
    var charact: String
    var level: Int
    var lifePoint: Int
    var healPlus: Int
//THIS STEP IS IMPORTAMT STEP "INITIALISION"
    init(name: String, charact: String, level: Int, lifePoint: Int, healPlus: Int) {
        self.name = name
        self.charact = charact
        self.level = level
        self.lifePoint = lifePoint
        self.healPlus = healPlus
    }
//CREATE FUNCTION FOR HEAL
    func heal() {
        lifePoint += healPlus
        print("The Hero \(name) has healed \(healPlus) point of life")
    }
}
//SUBCLASS 1
class Knight: Hero {
    func restOfLife() {
        if lifePoint < 0 {
            lifePoint = 0
        }
        print("Rest of life point for Lazarus : \(lifePoint)")
    }
}
//SUBCLASS 2
class Wizard: Hero {
    func restOfLife() {
        if lifePoint < 0 {
            lifePoint = 0
        }
        print("Rest of life for Elvin : \(lifePoint)")
    }
}
//VARIABLE
class ViewController: UIViewController {
//    .............
    var turn: Int = 0
    var winner = false
//    ..........
    var lazarus = Knight(name: "Lazarus", charact: "Knight", level: 90, lifePoint: 160, healPlus: 10)
    var elvin = Wizard(name: "Elvin", charact: "Wizard", level: 90, lifePoint: 140, healPlus: 15)
//  ...........
    var lazarusWeapon = Weapon(name: "Sword Attack", damage: 10)
    var lazarusPower = Power(name: "Mage Fist", damage: 30, specialEffect: 2)
//   ........
    var elvinWeapon = Weapon(name: "Stick of the Wise", damage: 15)
    var elvinPower = Power(name: "Fire Ball", damage: 20, specialEffect: 10)
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//    CREATE ACTION BUTTON FOR ROLLING THE DICE "UIBUTTON"
    @IBAction func rollingDice(_ sender: UIButton) {
        turn += 1
        if winner {
            print("THE END")
        } else {
            print("...........This is the turn number\(turn)..........")
            logicOfTheGame()
            print("..........This is the end of turn number\(turn)..........")
        }
    }
//    CREATE THE LOGIC OF THE GAME
    func logicOfTheGame() {
//        BY USE "SWITCH" TO MOVED
        switch rollingDice() {
        case 1:
            print("It's Lazarus Action & he use Heal")
            lazarus.heal()
            lazarus.restOfLife()
            elvin.restOfLife()
        case 2:
            print("Tt's Lazarus Action & he use the Weapon \(lazarusWeapon.name) VS Elvin")
            elvin.lifePoint -= lazarusWeapon.damage
            lazarus.restOfLife()
            elvin.restOfLife()
        case 3:
            print("It's Lazarus Action & he use the Power \(lazarusPower.name) VS Elvin")
            elvin.lifePoint -= lazarusPower.damage
            lazarus.lifePoint += lazarusPower.specialEffect
            lazarus.restOfLife()
            elvin.restOfLife()
        case 4:
            print("It's Elvin Action & he use Heal")
            elvin.heal()
            lazarus.restOfLife()
            elvin.restOfLife()
        case 5:
            print("It's Elvin Action & he use his Power \(elvinPower.name) VS Lazarus")
            lazarus.lifePoint -= elvinPower.damage
            lazarus.lifePoint -= elvinPower.specialEffect
            lazarus.restOfLife()
            elvin.restOfLife()
        case 6:
            print("It's Elvin Action & he use his Weapon \(elvinWeapon.name) VS Lazarus")
            lazarus.lifePoint -= elvinWeapon.damage
            lazarus.restOfLife()
            elvin.restOfLife()
        default:
            print("Error")
        }
        theWinnerIs(theFirst: lazarus, theSecond: elvin)
    }
//    FUNCTION FOR WHOSE WINNER OR LOSER
    func theWinnerIs(theFirst: Hero, theSecond: Hero) {
        
        if (theFirst.lifePoint <= 0) {
            print("The Winner is : \(theFirst.name) at turn \(turn)")
            winner = true
        }
        if (theSecond.lifePoint <= 0) {
            print("The winner is : \(theSecond.name) at turn \(turn)")
            winner = true
        }
    }
//    FUNCTION FOR ROLLING THE DICE
    func rollingDice() -> Int {
        var dice: Int
        dice = Int.random(in: 1...6)
        print("Dice = \(dice)")
        return dice
    }
}
