//
//  ViewController.swift
//  Jawaher_AbuLahah_lab12
//
//  Created by Jawaher Mohammad on 15/03/1443 AH.
//

import UIKit
// class Hero
class Hero{
var heroName : String
    var characteristic : String
    var level : Int
    var lifePoint : Int
    init(heroName : String,characteristic : String,level : Int,lifePoint : Int ){
        self.heroName = heroName
        self.characteristic = characteristic
        self.level = level
        self.lifePoint = lifePoint
    }
    //2 struct inside class
    struct Weapon{
            var name : String
            var damage : Int
            var attackAction : String
        }
        struct Power{
            var name : String
            var damage : Int
            var attackAction : String
            var specialEffect : String
           }
    //function when using a weapon get damage
    func useWeapon(damage:Int){
               lifePoint -= damage
    }
    //special effect for 2 hero
    func useLazarusPower(specialEffect : Int){
        lifePoint = specialEffect + 2
    }
    func useElvinPower(specialEffect:Int){
        lifePoint = specialEffect - 10
    }
    
}
//sup class
class Lazarus:Hero{
    func lazarusUseHeal(){
        lifePoint += 10
    }
}
class Elvin:Hero{
    func elvinUseHeal(){
        lifePoint += 15
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var winnerPhoto: UIImageView!
    @IBOutlet weak var winnerName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func rollTheDice(_ sender: Any) {
        randomDiceNum()
    }
   
    func randomDiceNum(){
        //initialization class and struct
        let knight = Lazarus(heroName: "Lazarus", characteristic: "Sword Attack, Mega Fist ", level: 1, lifePoint: 140)
        let wizard = Elvin(heroName: "Elvin", characteristic: "Fire Ball, Stick of the wise", level: 1, lifePoint: 160)
        let sowrd = Hero.Weapon(name: "Sowrd", damage: 10, attackAction: "Lazarus uses his powerfull sword to his opponent - 10 Damage")
        let megaFist = Hero.Power(name: "Mega Fist", damage: 30, attackAction: "Lazarus uses his Fist to beat his opponent - 30 Damage", specialEffect: " +2 to Life Point")
        let fireBall = Hero.Power(name: "Fire Ball", damage: 20, attackAction: "Elvin uses the powerful fire spell learned centuries ago - 20 Damage", specialEffect: " +10 damage")
        let stickOfTheWise = Hero.Weapon(name: "Stick Of TheWise", damage: 15, attackAction: "Elvin uses his magical and strange stick to beat his opponent - 15 Damage")
        
        //print
        print("--------------------------------------")
        print("First Hero: Name: ",knight.heroName,". Characteristic: ",knight.characteristic,". Level: ",knight.level,". Life Point: ",knight.lifePoint)
        print("Second Hero: Name:  ",wizard.heroName,". Characteristic: ",wizard.characteristic,". Level: ",wizard.level,". Life Point: ",wizard.lifePoint)
        print("--------------------------------------")
        //loop -> Do it until we have a winner
    while knight.lifePoint > 0 && wizard.lifePoint > 0 {
    //random Number (Roll Dice)
    let randomDice = Int.random(in: 1 ... 6)
    //Lazarus action
    if randomDice == 1 || randomDice == 2 || randomDice == 3{
        if randomDice == 1{
            print("*-> Lazarus use Heal ( 💉 ) +10 Life Point")
            print("Lazarus got life point : ",knight.lifePoint," + 10")
            knight.lazarusUseHeal()
            print(" = ",knight.lifePoint)
        }
        if randomDice == 2 {
            print("*-> Lazarus use Sword ( 🗡 ) -10 Damage")
            print("Elvin lost life point : ",wizard.lifePoint," - 10")
            let sowrdDamage = sowrd.damage
            wizard.useWeapon(damage: sowrdDamage)
            print(" = ",wizard.lifePoint)
        }
        if randomDice == 3 {
            print("*-> Lazarus use Mega Fist ( 👊🏻 ) -30 Damage")
            print("Elvin lost life point : ",wizard.lifePoint," - 30")
            let megaFistDamage = megaFist.damage
            wizard.useWeapon(damage: megaFistDamage)
            print(" = ",wizard.lifePoint)
            let lazarusPower = knight.lifePoint
            knight.useLazarusPower(specialEffect: lazarusPower)
           print("Lazarus Use Power -> +2 to Life Point ")
            print("Lazarus got life point = ",knight.lifePoint)
        }
    }else{ //Elvin action
        if randomDice == 4{
            print("*-> Elvin use Heal ( 💉 ) +15 Life Point")
            print("Elvin got life point : ",wizard.lifePoint," + 15")
            wizard.elvinUseHeal()
            print(" = ",wizard.lifePoint)
        }
        if randomDice == 5 {
            print("*-> Elvin use Fire Ball ( ☄️ ) -20 Damage")
            let elvinPower = knight.lifePoint
            knight.useElvinPower(specialEffect: elvinPower)
            print("Fire Ball Damage -> ",fireBall.damage," Elvin Use Power -> +10 damage ")
            let fireBallDamage = fireBall.damage
            knight.useWeapon(damage: fireBallDamage)
            print(" = ",knight.lifePoint)
        }
        if randomDice == 6 {
            print("*-> Elvin use Stick of Wise≠( 🦯 ) -15 Damage")
            print("Laz arus lost life point : ",knight.lifePoint," - 15 ")
            let stickOfTheWiseDamage = stickOfTheWise.damage
            knight.useWeapon(damage: stickOfTheWiseDamage)
            print(" = ",knight.lifePoint)
        }
    }
        }
        print("--------------------------------------")
        print("Lazarus life point : ",knight.lifePoint)
        print("Elvin life point : ",wizard.lifePoint)
        if knight.lifePoint > 0 {
            winnerPhoto.image = UIImage(named: "Lazarus")
            winnerName.text = "The Lazarus is the winner"
        print("The Lazarus is the winner")
            
        }else{
            winnerPhoto.image = UIImage(named: "Elvin")
            winnerName.text = "The Elvin is the winner"
            print("The Elvin is the winner")
            
        }
}
}
