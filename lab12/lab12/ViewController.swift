//
//  ViewController.swift
//  lab12
//
//  Created by grand ahmad on 16/03/1443 AH.
//

import UIKit
class Hero {
    var name: String
//    var characteristic: String
    var level: Int
    var lifePoint: Int
    init(name: String, characteristic: String,level: Int,lifePoint: Int) {
        self.name = name
//        self.characteristic = characteristic
        self.level = level
        self.lifePoint = lifePoint
    }
}
class Lazarus: Hero {

    var characteristic: String { "\(swordAttack.name), \(megaFist.name)"
    }
    var swordAttack: Weapon = Weapon(name: "Sword", damage: 10)
    var megaFist: Power = Power(name: "Mega Fist", damage: 30)
    
    func heal() {
        lifePoint += 10
    }
}
class Elvin: Hero {
    var characteristic: String { "\(fireBall.name), \(stickOfTheWise.name)"
    }
    var fireBall: Weapon = Weapon(name: "Fire Ball", damage: 20)
    var stickOfTheWise: Power = Power(name: "Stick of the Wise", damage: 15)

    func heal() {
        lifePoint += 15
    }
}

struct Weapon {
    var name: String
  var damage: Int
    func attack() -> Int {
       return damage
    }
}
struct Power {
    var name: String
   var damage: Int
    func attack() -> Int {
      return damage
    }
    func special() {
        
    }
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var levelElvin: UILabel!
    @IBOutlet weak var charElvin: UILabel!
    @IBOutlet weak var lifeElvin: UILabel!
    
    @IBOutlet weak var levelLazarus: UILabel!
    @IBOutlet weak var charLazarus: UILabel!
    @IBOutlet weak var lifeLazarus: UILabel!
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var lazarus: Lazarus = Lazarus(name: "Lazarus", characteristic: "", level: 1, lifePoint: 160)
    var elvin: Elvin = Elvin(name: "Elven", characteristic: "", level: 1, lifePoint: 140)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabels()
    }
    
    @IBAction func buttonAction(_ sender: Any) {
        rollDice()
    }
    
    
    func rollDice() {
        var result: Int = .random(in: 1...6)
        button.setTitle("dice: \(result)", for: .normal)
        switch result {
        case 1:
            lazarus.heal()
            label.text = "Lazarus Healed"
            print("Lazarus Healed")
        case 2:
            elvin.lifePoint -= lazarus.swordAttack.attack()
            label.text = "Lazarus Sword Attack"
            print("Lazarus Sword Attack")
        case 3:
            elvin.lifePoint -= lazarus.megaFist.attack()
            label.text = "lazarus Mega Fist"
            print("lazarus Mega Fist")
        case 4:
            elvin.heal()
            label.text = "Elvin Healed"
            print("Elvin Healed")
        case 5:
            lazarus.lifePoint -= elvin.fireBall.attack()
            label.text = "Elvin Fire Ball"
            print("Elvin Fire Ball")
        case 6:
            lazarus.lifePoint -= elvin.stickOfTheWise.attack()
            label.text = "Elivn Stick of the Wise"
            print("Elivn Stick of the Wise")
        default: print(0)
        }
        checkWinner()
        updateLabels()
    }
    func updateLabels() {
        levelElvin.text = "Level: \(elvin.level)"
        charElvin.text = "\(elvin.characteristic)"
        lifeElvin.text = "Life: \(elvin.lifePoint)"
        
        levelLazarus.text = "Lavel: \(lazarus.level)"
        charLazarus.text = "\(lazarus.characteristic)"
        lifeLazarus.text = "Life: \(lazarus.lifePoint)"
    }
    func checkWinner() {
        if lazarus.lifePoint <= 0 {
            print("elvin killed lazarus")
            lifeLazarus.textColor = .red
            label.text = "elvin killed lazarus"
            elvin.level += 1
            restart()
        }
        if elvin.lifePoint <= 0 {
            print("lazarus killed elvin")
            lifeElvin.textColor = .red
            label.text = "lazarus killed elvin"
            lazarus.level += 1
            restart()
        }
    }
    func restart() {
        button.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.lazarus.lifePoint = 160
            self.lifeLazarus.textColor = .black
            self.elvin.lifePoint = 140
            self.lifeElvin.textColor = .black
            self.button.isEnabled = true
        }
    }
}
    
